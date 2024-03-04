//
//  ListOfMoviesInteractor.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import CoreData
import UIKit

protocol ListOfMoviesInteractorPresenterProtocol {

}

class ListOfMoviesInteractor {
    weak var presenter: ListOfMoviesPresenterInteractorProtocol?

}

extension ListOfMoviesInteractor: ListOfMoviesInteractorPresenterProtocol {
    
}

