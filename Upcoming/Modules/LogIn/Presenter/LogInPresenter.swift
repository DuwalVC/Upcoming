//
//  LogInPresenter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

protocol LogInPresenterViewControllerProtocol {
    func validate(_ user: String, _ password: String)
}

protocol LogInPresenterInteractorProtocol: AnyObject {
    func showListOfMovies()
    func showErrorAlert(error: String)
}

protocol LogInPresenterRouterProtocol: AnyObject {
    
}

class LogInPresenter {
    weak var view: LogInViewControllerPresenterProtocol?
    var interactor: LogInInteractorPresenterProtocol?
    var router: LogInRouterPresenterProtocol?
}

extension LogInPresenter: LogInPresenterViewControllerProtocol {
    func validate(_ user: String, _ password: String) {
        interactor?.validate(user, password)
    }
    
}

extension LogInPresenter: LogInPresenterInteractorProtocol {
    func showErrorAlert(error: String) {
        router?.showErrorAlert(error: error)
    }
    
    func showListOfMovies() {
        router?.showListOfMovies()
    }
    
}

extension LogInPresenter: LogInPresenterRouterProtocol {
    
}
