//
//  LogInInteractor.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

protocol LogInInteractorPresenterProtocol{
    
}

class LogInInteractor {
    weak var presenter: LogInPresenterInteractorProtocol?
}

extension LogInInteractor: LogInInteractorPresenterProtocol {
    
}
