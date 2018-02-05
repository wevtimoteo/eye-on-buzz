//
//  UpcomingMoviesViewController.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/25/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UITableViewController, DataSourceTarget {
    
    var genresDataSource: GenresDataSource?
    var upcomingMoviesDataSource: UpcomingMoviesDataSource?
    
    let numberOfSections: Int = 1
    let cellIdentifier = "Cell"
    let cellRowHeight: CGFloat = 148.0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.subscribe()
        
        self.genresDataSource = GenresDataSource.init(dataSourceTarget: self)
        self.upcomingMoviesDataSource = UpcomingMoviesDataSource.init(dataSourceTarget: self)
        
        self.tableView.accessibilityLabel = "Upcoming Movies"
        self.tableView.register(UINib.init(nibName: "UpcomingMovieCell", bundle: nil), forCellReuseIdentifier: self.cellIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupAppearance()
        
        LoadingIndicator.start()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(updateData), for: UIControlEvents.valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if genresDataSource!.list.isEmpty || upcomingMoviesDataSource!.list.isEmpty {
            self.updateData()
        }
    }
    
    func subscribe() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: .fetchUpcomingMoviesData, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showInvalidAPIKeyMessage), name: .invalidAPIKey, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showUnreachableNetworkMessage), name: .unreachableNetwork, object: nil)
    }
    
    // MARK: - Data
    
    @objc func updateData() {
        self.genresDataSource?.fetch()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        LoadingIndicator.start()
        
        let upcomingMovie = self.upcomingMoviesDataSource?.atIndex(indexPath.row) as! UpcomingMovie
        
        let upcomingMovieViewController = UpcomingMovieViewController(upcomingMovie)
        
        self.navigationController?.pushViewController(upcomingMovieViewController, animated: true)
        self.navigationItem.backBarButtonItem = BackButton.build()
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if (maximumOffset - currentOffset) <= 150.0  && !self.upcomingMoviesDataSource!.isLastPage() {
            LoadingIndicator.start()
            
            DispatchQueue.global(qos: .background).async {
                self.upcomingMoviesDataSource?.fetchNextPage()
            }
        }
    }
    
    // MARK: - DataSourceTarget Protocol
    
    func dataRefreshed(source: DataSource.RefreshSource, status: DataSource.RefreshStatus) {
        switch status {
        case .success:
            checkSuccessDataSource(source)
        case .failure:
            showMessageView("An error occurred, cannot fetch movies. Please try again", tryAgain: true)
        }
    }
    
    func checkSuccessDataSource(_ source: DataSource.RefreshSource) {
        switch source {
        case .genreList:
            GenresRepository.setup(list: (self.genresDataSource?.list)!)
            
            self.upcomingMoviesDataSource?.fetch()
        case .dontCare:
            self.tableView.separatorColor = Colors.byProperty("tableSeparator")
            self.tableView.backgroundView?.isHidden = true
            
            // TODO: Check if list is empty
            self.tableView.reloadData()
            
            self.tableView.refreshControl?.endRefreshing()
            
            LoadingIndicator.stop()
        }
    }
    
    @objc func showInvalidAPIKeyMessage() {
        showMessageView("Invalid API key, please setup credentials then build again.")
    }
    
    @objc func showUnreachableNetworkMessage() {
        showMessageView("Please check your network connection.", tryAgain: true)
    }
    
    @objc func showMessageView(_ title: String, tryAgain: Bool = false) {
        let messageView = MessageView(frame: self.navigationController!.view.frame)
        
        let tryAgainAction: Notification.Name? = tryAgain ? .fetchUpcomingMoviesData : nil
        
        messageView.setup(title, notificationAction: tryAgainAction)
        
        self.tableView.separatorColor = Colors.byProperty("tableSeparatorClear")
        
        self.tableView.backgroundView = messageView
        self.tableView.backgroundView?.isHidden = false
        
        self.tableView.refreshControl?.endRefreshing()
        LoadingIndicator.stop()
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.upcomingMoviesDataSource?.count())!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UpcomingMovieCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! UpcomingMovieCell
        
        cell.fillInfo(self.upcomingMoviesDataSource!.atIndex(indexPath.row) as! UpcomingMovie)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellRowHeight
    }
    
    // MARK: - Setup appearance
    
    func setupAppearance() {
        self.navigationItem.title = "Upcoming Movies"
        
        self.tableView.refreshControl?.tintColor = Colors.byProperty("activityIndicator")
        
        self.tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 1.0, right: 0)
        
        self.tableView.backgroundColor = Colors.byProperty("tableViewBackground")
        self.tableView.separatorColor = Colors.byProperty("tableSeparator")
        
        self.parent?.view.backgroundColor = Colors.byProperty("tableBackground")
        
        // Don't preserve selection between presentations.
        self.clearsSelectionOnViewWillAppear = false
    }
    
}
