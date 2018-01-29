//
//  UpcomingMovieViewController.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/29/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class UpcomingMovieViewController: UIViewController {
    
    let upcomingMovie: UpcomingMovie
    
    init(_ upcomingMovie: UpcomingMovie) {
        self.upcomingMovie = upcomingMovie
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = upcomingMovie.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
