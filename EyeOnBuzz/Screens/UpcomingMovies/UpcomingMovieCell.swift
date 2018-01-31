//
//  UpcomingMovieCell.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/26/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit
import TagListView

class UpcomingMovieCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var genreTagListView: TagListView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.setupAppearance()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillInfo(_ upcomingMovie: UpcomingMovie) {
        self.title?.text = upcomingMovie.title
        self.releaseDate?.text = upcomingMovie.releaseDate
        
        genreTagListView.removeAllTags()
        
        let genreNames: Array<String> = GenresRepository.sharedInstance.namesByIdentifiers(upcomingMovie.genreIdentifiers)
        genreTagListView.addTags(genreNames)
        
        self.posterImage?.image = TMDBImageFactory.fromPath(upcomingMovie.posterPath)
    }
    
    func setupAppearance() {
        genreTagListView.textFont = UIFont.systemFont(ofSize: 11)
        genreTagListView.alignment = .right
    }
    
}
