//
//  LogInInteractor.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

protocol LogInInteractorPresenterProtocol{
    func validate(_ user: String, _ password: String)
}

class LogInInteractor {
    weak var presenter: LogInPresenterInteractorProtocol?
}

extension LogInInteractor: LogInInteractorPresenterProtocol {
    func validate(_ user: String, _ password: String) {
        
        do {
            try Validations.user(user)
            try Validations.password(password)
            if (user == "Admin" && password == "Password*123") {
                print("usuario valido")
                presenter?.showListOfMovies()
            } else {
                print("usuario no valido")
            }
        } catch {
            presenter?.showErrorAlert(error: "No cumple con los criterios de seguridad")
        }
        
    }
    
}
