//
//  UpcomingMoviesDataSource.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/24/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

class UpcomingMoviesDataSource: ListDataSource {
    
    func fetch() {
        // TODO: Pass API Key on GET request
        self.session.get(url: Router.TheMovieDatabaseAPI.upcomingMovies, parameters: nil, success: { statusCode, headers, response in
            let upcomingMovies = NSMutableArray()
            
            if let fullResponse = response as? Dictionary<String, Any> {
                self.processPaginationInfo(fullResponse)
                
                if let upcomingMoviesResponse = fullResponse["results"] as? [Dictionary<String, Any>] {
                    for upcomingMovieResponse in upcomingMoviesResponse {
                        let upcomingMovie = UpcomingMovie.init(upcomingMovieResponse)
                        
                        upcomingMovies.add(upcomingMovie)
                    }
                }
                
                self.list = upcomingMovies as! Array<UpcomingMovie>
            }
            
            self.targetTable.dataRefreshed(source: DataSource.RefreshSource.dontCare, status: DataSource.RefreshStatus.success)
        }, failure: { statusCode, response in
            self.targetTable.dataRefreshed(source: DataSource.RefreshSource.dontCare, status: DataSource.RefreshStatus.failure)
        })
    }

}
