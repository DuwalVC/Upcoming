//
//  LogInConfiguration.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import UIKit

class LogInConfigurator {
    
    static func makeView() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(identifier: "LogInIdentifier") as? LogInViewController else{
            return UIViewController()
        }
        
        let interactor = LogInInteractor()
        let router = LogInRouter()
        let presenter = LogInPresenter()

        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.view = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
