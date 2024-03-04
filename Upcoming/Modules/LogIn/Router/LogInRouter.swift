//
//  LogInRouter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import UIKit

protocol LogInRouterPresenterProtocol {
    
}

class LogInRouter{
    weak var view: UIViewController?
    weak var presenter: LogInPresenterRouterProtocol?
}

extension LogInRouter: LogInRouterPresenterProtocol {
    
}
