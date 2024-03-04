//
//  MovieDetailsRouter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import UIKit

protocol MovieDetailsRouterPresenterProtocol {
    
}

class MovieDetailsRouter {
    weak var view: UIViewController?
    weak var presenter: MovieDetailsPresenterRouterProtocol?
}

extension MovieDetailsRouter: MovieDetailsRouterPresenterProtocol {
    
}
