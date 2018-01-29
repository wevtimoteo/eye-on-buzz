//
//  UpcomingMoviesViewController.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/25/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UITableViewController, DataSourceTarget {
    
    var upcomingMoviesDataSource: UpcomingMoviesDataSource?
    
    let numberOfSections: Int = 1
    let cellIdentifier = "Cell"
    let cellRowHeight: CGFloat = 148.0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        LoadingIndicator.start()
        
        self.updateData()
    }
    
    func updateData() {
        self.upcomingMoviesDataSource?.fetch()
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
        self.tableView.reloadData()
        
        LoadingIndicator.stop()
        
        self.tableView.refreshControl?.endRefreshing()
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
        
        self.tableView.separatorColor = Colors.byProperty("tableSeparator")
        self.tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 1.0, right: 0)
        
        self.tableView.backgroundColor = Colors.byProperty("tableViewBackground")
        
        self.parent?.view.backgroundColor = Colors.byProperty("tableBackground")
        
        // Don't preserve selection between presentations.
        self.clearsSelectionOnViewWillAppear = false
    }
    
}
