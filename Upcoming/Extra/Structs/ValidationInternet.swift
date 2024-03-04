//
//  ValidationInternet.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import Reachability

struct Internet {
    static func connectedToTheInternet() -> Bool {
        let reachability = try! Reachability()
        
        switch reachability.connection {
        case .wifi, .cellular:
            return true
        case .unavailable:
            return false
        }
    }
}
