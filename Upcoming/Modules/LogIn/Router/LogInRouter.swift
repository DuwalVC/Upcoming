//
//  LogInRouter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import UIKit

protocol LogInRouterPresenterProtocol {
    func showListOfMovies()
    func showErrorAlert(error: String)
}

class LogInRouter{
    weak var view: UIViewController?
    weak var presenter: LogInPresenterRouterProtocol?
}

extension LogInRouter: LogInRouterPresenterProtocol {
    func showErrorAlert(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        view?.present(alert, animated: true, completion: nil)
    }
    
    func showListOfMovies() {
        view?.navigationController?.pushViewController(ListOfMoviesConfigurator.makeView(), animated: true)
    }
    
}
