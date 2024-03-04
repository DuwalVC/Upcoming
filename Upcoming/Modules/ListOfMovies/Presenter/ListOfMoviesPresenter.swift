//
//  ListOfMoviesPresenter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

protocol ListOfMoviesPresenterViewControllerProtocol {
    
}

protocol ListOfMoviesPresenterInteractorProtocol: AnyObject {
    
}

protocol ListOfMoviesPresenterRouterProtocol: AnyObject {
    
}

class ListOfMoviesPresenter {
    weak var view: ListOfMoviesViewControllerPresenterProtocol?
    var interactor: ListOfMoviesInteractorPresenterProtocol?
    var router: ListOfMoviesRouterPresenterProtocol?
}

extension ListOfMoviesPresenter: ListOfMoviesPresenterViewControllerProtocol {
    
}

extension ListOfMoviesPresenter: ListOfMoviesPresenterInteractorProtocol {
    
}

extension ListOfMoviesPresenter: ListOfMoviesPresenterRouterProtocol {
    
}
