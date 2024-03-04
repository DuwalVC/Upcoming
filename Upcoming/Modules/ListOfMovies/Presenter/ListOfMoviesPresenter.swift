//
//  ListOfMoviesPresenter.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

protocol ListOfMoviesPresenterViewControllerProtocol {
    func getListOfMovies(page: Int)
    func showMovieDetails(movie: Result)

}

protocol ListOfMoviesPresenterInteractorProtocol: AnyObject {
    func setMovies(_ movies: [Result])
    func showErrorAlert(error: String)
    func setDataListOfMovies(_ data: ListOfMovies)
}

protocol ListOfMoviesPresenterRouterProtocol: AnyObject {
    
}

class ListOfMoviesPresenter {
    weak var view: ListOfMoviesViewControllerPresenterProtocol?
    var interactor: ListOfMoviesInteractorPresenterProtocol?
    var router: ListOfMoviesRouterPresenterProtocol?
}

extension ListOfMoviesPresenter: ListOfMoviesPresenterViewControllerProtocol {
    
    
    func showMovieDetails(movie: Result) {
        router?.showMovieDetails(movie: movie)
    }
    
    func getListOfMovies(page: Int) {
        interactor?.getListOfMovies(page: page)
    }
    
}

extension ListOfMoviesPresenter: ListOfMoviesPresenterInteractorProtocol {
    func setMovies(_ movies: [Result]) {
        view?.setMovies(movies)
    }
    
    func showErrorAlert(error: String) {
        router?.showErrorAlert(error: error)
    }
    
    func setDataListOfMovies(_ data: ListOfMovies) {
        view?.setDataListOfMovies(data)
    }
    
}

extension ListOfMoviesPresenter: ListOfMoviesPresenterRouterProtocol {
    
}
