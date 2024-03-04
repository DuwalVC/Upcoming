//
//  ListOfMoviesViewController.swift
//  Upcoming
//
//  Created by dvarillc on 4/03/24.
//

import UIKit

protocol ListOfMoviesViewControllerPresenterProtocol: AnyObject {
    func setMovies(_ movies: [Result])
    func setDataListOfMovies(_ data: ListOfMovies)
}

class ListOfMoviesViewController: UIViewController {
    
    var loading = false
    var dataTable: [Result] = []
    var listOfMovies: ListOfMovies?
    var presenter: ListOfMoviesPresenterViewControllerProtocol?
    
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        if Internet.connectedToTheInternet() {
            presenter?.deleteAllMovies()
        }
    }

}

extension ListOfMoviesViewController: ListOfMoviesViewControllerPresenterProtocol {
    func setMovies(_ movies: [Result]) {
        dataTable = movies
        self.table.reloadData()
    }
    
    func setDataListOfMovies(_ data: ListOfMovies) {
        dataTable.append(contentsOf: data.results)
        listOfMovies = data
        self.table.reloadData()
        loading = false
    }
    
}

extension ListOfMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfMoviesCellIdentifier") as? ListOfMoviesTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(title: dataTable[indexPath.row].title ?? "")
        return cell
    }
    
    
}

extension ListOfMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMovieDetails(movie: dataTable[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListOfMoviesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (table.contentSize.height - 100 - scrollView.frame.size.height) {
            
            let requestPage = (listOfMovies?.page ?? 0) + 1
            
            if requestPage <= listOfMovies?.totalPages ?? 1 {
                if !loading {
                    loading = true
                    presenter?.getListOfMovies(page: requestPage)
                    print("SOLICITANDO .... \(requestPage)")
                } else {
                    print("CARGANDO .... \(requestPage)")
                }
            } else {
                print("No hay mas paginas")
            }
           
            
        }
    }
}
