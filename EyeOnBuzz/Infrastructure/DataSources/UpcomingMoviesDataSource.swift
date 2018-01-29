//
//  UpcomingMoviesDataSource.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/24/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

class UpcomingMoviesDataSource: ListDataSource {
    
    override func fetch(page: Int = 1) {
        let parameters: [String : Any] = [
            "page": page,
            ]
        
        self.session.get(url: Router.TheMovieDatabaseAPI.upcomingMovies, parameters: parameters, success: { statusCode, headers, response in
            DispatchQueue.main.async {
                if let fullResponse = response as? Dictionary<String, Any> {
                    self.processPaginationInfo(fullResponse)
                    
                    if let upcomingMoviesResponse = fullResponse[TMDBSession.Body.results] as? [Dictionary<String, Any>] {
                        for upcomingMovieResponse in upcomingMoviesResponse {
                            let upcomingMovie = UpcomingMovie.init(upcomingMovieResponse)
                            
                            self.list.append(upcomingMovie)
                        }
                    }
                }
                
                self.dataSourceTarget.dataRefreshed(source: DataSource.RefreshSource.dontCare, status: DataSource.RefreshStatus.success)
            }
        }, failure: { statusCode, response in
            DispatchQueue.main.async {
                self.dataSourceTarget.dataRefreshed(source: DataSource.RefreshSource.dontCare, status: DataSource.RefreshStatus.failure)
            }
        })
    }
    
}
