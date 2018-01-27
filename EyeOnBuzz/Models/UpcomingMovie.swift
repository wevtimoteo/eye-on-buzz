//
//  UpcomingMovie.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/24/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

class UpcomingMovie {
    
    let identifier: Int
    let title: String
    let popularity: Double
    let video: Bool
    let voteCount: Int
    let voteAverage: Double
    let posterPath: String?
    let originalLanguage: String
    let originalTitle: String
    let genreIdentifiers: Array<Int>
    let backdropPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String
    
    init(_ upcomingMovieInfo: Dictionary<String, Any>) {
        self.identifier = upcomingMovieInfo["id"] as! Int
        self.title = upcomingMovieInfo["title"] as! String
        self.popularity = upcomingMovieInfo["popularity"] as! Double
        self.video = upcomingMovieInfo["video"] as! Bool
        self.voteCount = upcomingMovieInfo["vote_count"] as! Int
        self.voteAverage = upcomingMovieInfo["vote_average"] as! Double
        self.posterPath = upcomingMovieInfo["poster_path"] as? String
        self.originalLanguage = upcomingMovieInfo["original_language"] as! String
        self.originalTitle = upcomingMovieInfo["original_title"] as! String
        self.genreIdentifiers = upcomingMovieInfo["genre_ids"] as! Array<Int>
        self.backdropPath = upcomingMovieInfo["backdrop_path"] as? String
        self.adult = upcomingMovieInfo["adult"] as! Bool
        self.overview = upcomingMovieInfo["overview"] as! String
        self.releaseDate = upcomingMovieInfo["release_date"] as! String
    }
    
}
