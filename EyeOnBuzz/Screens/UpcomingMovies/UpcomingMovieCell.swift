//
//  UpcomingMovieCell.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/26/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class UpcomingMovieCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillInfo(_ upcomingMovie: UpcomingMovie) {
        self.title?.text = upcomingMovie.title
        self.releaseDate?.text = upcomingMovie.releaseDate
        
        self.genre?.text = fetchGenreNames(upcomingMovie.genreIdentifiers)
        
        self.posterImage?.image = TMDBImageFactory.fromPath(upcomingMovie.posterPath)
    }
    
    func fetchGenreNames(_ genreIdentifiers: Array<Int>) -> String {
        var genreNames = Array<String>()
        
        for genreIdentifier in genreIdentifiers {
            genreNames.append(GenresRepository.sharedInstance.nameByIdentifier(genreIdentifier))
        }
        
        return genreNames.joined(separator: ", ")
    }
    
}
