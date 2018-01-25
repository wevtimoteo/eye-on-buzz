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
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.upcomingMoviesDataSource = UpcomingMoviesDataSource.init(targetTable: self)
        
        self.tableView.accessibilityLabel = "Upcoming Movies"
        self.tableView.register(UINib.init(nibName: "UpcomingMovieCell", bundle: nil), forCellReuseIdentifier: self.cellIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - DataSourceTarget Protocol
    
    func dataRefreshed(source: DataSource.RefreshSource, status: DataSource.RefreshStatus) {
        self.tableView.reloadData()
        
        self.tableView.refreshControl?.endRefreshing()
    }
    
}
