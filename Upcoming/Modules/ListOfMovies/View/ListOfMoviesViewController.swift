//
//  ListOfMoviesViewController.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import UIKit

protocol ListOfMoviesViewControllerPresenterProtocol: AnyObject {

}

class ListOfMoviesViewController: UIViewController {
    
    var presenter: ListOfMoviesPresenterViewControllerProtocol?
    
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ListOfMoviesViewController: ListOfMoviesViewControllerPresenterProtocol {
    
}

extension ListOfMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfMoviesCellIdentifier") as? ListOfMoviesTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(title: "prueba")
        return cell
    }
    
    
}

extension ListOfMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ListOfMoviesViewController: UIScrollViewDelegate {
    
}
