//
//  ListOfMoviesRouter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import UIKit

protocol ListOfMoviesRouterPresenterProtocol {
    func showErrorAlert(error: String)
    func showMovieDetails(movie: Result)
}

class ListOfMoviesRouter {
    var view: UIViewController?
    weak var presenter: ListOfMoviesPresenterRouterProtocol?
}

extension ListOfMoviesRouter: ListOfMoviesRouterPresenterProtocol {
    func showMovieDetails(movie: Result) {
        view?.navigationController?.pushViewController(MovieDetailsConfigurator.makeView(movie: movie), animated: true)
    }
    
    func showErrorAlert(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        view?.present(alert, animated: true, completion: nil)
    }
}
