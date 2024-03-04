//
//  LogInPresenter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

protocol LogInPresenterViewControllerProtocol {
    
}

protocol LogInPresenterInteractorProtocol: AnyObject {
    
}

protocol LogInPresenterRouterProtocol: AnyObject {
    
}

class LogInPresenter {
    weak var view: LogInViewControllerPresenterProtocol?
    var interactor: LogInInteractorPresenterProtocol?
    var router: LogInRouterPresenterProtocol?
}

extension LogInPresenter: LogInPresenterViewControllerProtocol {
    
}

extension LogInPresenter: LogInPresenterInteractorProtocol {
    
}

extension LogInPresenter: LogInPresenterRouterProtocol {
    
}
