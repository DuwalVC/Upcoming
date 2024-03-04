//
//  MovieDetailsPresenter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

protocol MovieDetailsPresenterViewControllerProtocol {
    
}

protocol MovieDetailsPresenterInteractorProtocol: AnyObject {
    
}

protocol MovieDetailsPresenterRouterProtocol: AnyObject {
    
}


class MovieDetailsPresenter {
    weak var view: MovieDetailsViewControllerPresenterProtocol?
    var interactor: MovieDetailsInteractorPresenterProtocol?
    var router: MovieDetailsRouterPresenterProtocol?
}

extension MovieDetailsPresenter: MovieDetailsPresenterViewControllerProtocol {
    
}

extension MovieDetailsPresenter: MovieDetailsPresenterInteractorProtocol {
    
}

extension MovieDetailsPresenter: MovieDetailsPresenterRouterProtocol {
    
}
