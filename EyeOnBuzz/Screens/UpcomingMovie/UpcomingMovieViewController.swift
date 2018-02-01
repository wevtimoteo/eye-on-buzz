//
//  UpcomingMovieViewController.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/29/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit
import TagListView

class UpcomingMovieViewController: UIViewController {
    
    @IBOutlet weak var movieScrollView: UIScrollView!
    @IBOutlet var movieView: UIView!
    @IBOutlet weak var backdropView: UIView!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var genreTagListView: TagListView!
    @IBOutlet weak var overviewTextView: UITextView!
    
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
        
        self.fillData()
        self.setupAppearance()
        self.setupScrolling()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        LoadingIndicator.stop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        overviewTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    // MARK: - Data
    
    func fillData() {
        self.movieTitle?.text = upcomingMovie.title
        self.releaseDate?.text = upcomingMovie.releaseDate
        self.overviewTextView?.text = upcomingMovie.overview
        
        let genreNames: Array<String> = GenresRepository.sharedInstance.namesByIdentifiers(upcomingMovie.genreIdentifiers)
        genreTagListView.addTags(genreNames)
        
        // TODO: Get available backdrop size dynamically
        self.backdropImageView?.image = TMDBImageFactory.fromPath(upcomingMovie.backdropPath, size: "780")
        self.posterImage?.image = TMDBImageFactory.fromPath(upcomingMovie.posterPath)
    }
    
    // MARK: - Appearance
    
    func setupAppearance() {
        genreTagListView.backgroundColor = Colors.byProperty("tagListBackground")
        genreTagListView.tagBackgroundColor = Colors.byProperty("tagBackground")
        
        genreTagListView.textFont = UIFont.systemFont(ofSize: 11)
        genreTagListView.alignment = .right
        
        overviewTextView.backgroundColor = Colors.byProperty("textFieldBackground")
        overviewTextView.textColor = Colors.byProperty("textField")
    }
    
    func setupScrolling() {
        // This is needed before setup scrolling, since the content view size may change according to the device screen size
        let screenSize = UIScreen.main.bounds.size
        let navigationBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        let contentHeight = screenSize.height - navigationBarHeight - statusBarHeight
        
        movieView.frame = CGRect.init(x: 0, y: navigationBarHeight - statusBarHeight, width: screenSize.width, height: contentHeight)
        
        movieScrollView.addSubview(movieView)
    }

}
