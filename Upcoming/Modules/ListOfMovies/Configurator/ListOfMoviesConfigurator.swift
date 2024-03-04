//
//  ListOfMoviesConfigurator.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import UIKit

class ListOfMoviesConfigurator {
    
    static func makeView() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(identifier: "ListOfMoviesIdentifier") as? ListOfMoviesViewController else{
            return UIViewController()
        }
        
        let interactor = ListOfMoviesInteractor()
        let router = ListOfMoviesRouter()
        let presenter = ListOfMoviesPresenter()

        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        router.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
