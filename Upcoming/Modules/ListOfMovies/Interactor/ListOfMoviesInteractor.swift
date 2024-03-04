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
    func getListOfMovies(page: Int)
}

class ListOfMoviesInteractor {
    weak var presenter: ListOfMoviesPresenterInteractorProtocol?
    var api: ServicesClientHTTPListOfMovie?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func saveResponse(_ data: ListOfMovies){
        let context = appDelegate.persistentContainer.viewContext
        context.perform {
            let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context)!
            let batchInsert = NSBatchInsertRequest(entity: entity, objects: data.results.map { [
                "voteAverage": $0.voteAverage,
                "title": $0.title ?? "",
                "releaseDate": $0.releaseDate ?? "",
                "posterPath": $0.posterPath ?? "",
                "overview": $0.overview ?? ""
            ] })
            
            do {
                try context.execute(batchInsert)
                try context.save()
                print("CoreData: Se Guardo")
            } catch {
                print("CoreData: No se Guardo \(error)")
            }
        }
    }
    
    
    
}

extension ListOfMoviesInteractor: ListOfMoviesInteractorPresenterProtocol {

    func getListOfMovies(page: Int) {
        
        Task { [weak self] in
            guard let self = self else { return }
            
            do {
                guard let response = try await api?.getListOfMovies(page: page) else {
                    return
                }
                DispatchQueue.main.async {
                    self.presenter?.setDataListOfMovies(response)
                    self.saveResponse(response)
                }
            
            } catch {
                print("Error MuscleWorkHistory: (sin descripcion) --------")
                print(error)
                DispatchQueue.main.async {
                    self.presenter?.showErrorAlert(error: error.localizedDescription)
                }
            }
        }
        
    }
    
}
