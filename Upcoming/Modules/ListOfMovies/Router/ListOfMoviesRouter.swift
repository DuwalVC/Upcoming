//
//  ListOfMoviesRouter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import UIKit

protocol ListOfMoviesRouterPresenterProtocol {

}

class ListOfMoviesRouter {
    var view: UIViewController?
    weak var presenter: ListOfMoviesPresenterRouterProtocol?
}

extension ListOfMoviesRouter: ListOfMoviesRouterPresenterProtocol {
    
}
