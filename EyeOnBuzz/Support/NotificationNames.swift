//
//  NotificationNames.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/24/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let invalidAPIKey = Notification.Name("InvalidAPIKey")
    static let unreachableNetwork = Notification.Name("UnreachableNetwork")
    static let fetchUpcomingMoviesData = Notification.Name("FetchUpcomingMoviesData")
}
