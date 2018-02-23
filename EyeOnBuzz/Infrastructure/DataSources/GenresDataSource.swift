//
//  GenresDataSource.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/28/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

class GenresDataSource {
    
    let session = TMDBSession.init()
    let resultsNodeName = "genres"
    let dataSourceTarget: DataSourceTarget
    
    var list = [Int: String]()
    
    init(dataSourceTarget: DataSourceTarget) {
        self.dataSourceTarget = dataSourceTarget
    }
    
    func fetch() {
        self.session.get(url: Router.TheMovieDatabaseAPI.genres, parameters: nil, success: { statusCode, headers, response in
            DispatchQueue.main.async {
                if let fullResponse = response as? Dictionary<String, Any> {
                    if let genresResponse = fullResponse[self.resultsNodeName] as? [Dictionary<String, Any>] {
                        for genreResponse in genresResponse {
                            let genre = Genre.init(genreResponse)
                            
                            self.list[genre.identifier] = genre.name
                        }
                    }
                }
                
                self.dataSourceTarget.dataRefreshed(source: DataSource.RefreshSource.genreList, status: DataSource.RefreshStatus.success)
            }
        }, failure: { statusCode, response in
            DispatchQueue.main.async {
                self.dataSourceTarget.dataRefreshed(source: DataSource.RefreshSource.genreList, status: DataSource.RefreshStatus.failure)
            }
        })
    }


    
}
