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
        
        // TODO: Use GenreList to identify main genre by ID
        self.genre?.text = String.init(describing: upcomingMovie.genreIdentifiers.first)
        
        // TODO: Use real movie poster image
        if let data = try? Data(contentsOf: URL(string: "https://image.tmdb.org/t/p/w92/dfhztJRiElqmYW4kpvjYe1gENsD.jpg")!) {
            self.posterImage?.image = UIImage.init(data: data)
        }
    }
    
}
