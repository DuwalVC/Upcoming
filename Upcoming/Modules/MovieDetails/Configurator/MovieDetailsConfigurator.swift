//
//  MovieDetailsConfigurator.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import UIKit

class MovieDetailsConfigurator {
    
    static func makeView() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(identifier: "MovieDetailsIdentifier") as? MovieDetailsViewController else{
            return UIViewController()
        }
        
        let interactor = MovieDetailsInteractor()
        let router = MovieDetailsRouter()
        let presenter = MovieDetailsPresenter()

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
