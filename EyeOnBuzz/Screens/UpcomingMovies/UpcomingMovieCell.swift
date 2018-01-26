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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillInfo(_ upcomingMovie: UpcomingMovie) {
        self.title?.text = upcomingMovie.title
    }
    
}
