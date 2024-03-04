//
//  MovieDetailsViewController.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import UIKit

protocol MovieDetailsViewControllerPresenterProtocol: AnyObject {
    
}

class MovieDetailsViewController: UIViewController {
    
    var presenter: MovieDetailsPresenterViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension MovieDetailsViewController: MovieDetailsViewControllerPresenterProtocol {
    
}
