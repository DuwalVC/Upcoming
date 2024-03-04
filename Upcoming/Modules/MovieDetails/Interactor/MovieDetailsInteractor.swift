//
//  MovieDetailsInteractor.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

protocol MovieDetailsInteractorPresenterProtocol {
    
}

class MovieDetailsInteractor {
    weak var presenter: MovieDetailsPresenterInteractorProtocol?
}

extension MovieDetailsInteractor: MovieDetailsInteractorPresenterProtocol {
    
}
