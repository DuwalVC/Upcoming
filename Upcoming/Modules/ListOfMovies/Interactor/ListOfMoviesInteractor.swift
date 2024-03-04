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
    func deleteAllMovies()
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
    
    func getAllMovies() -> [Result]{
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()

        do {
            let moviesEntities = try context.fetch(fetchRequest)
            let movies = moviesEntities.map {
                Result(
                    title: $0.title,
                    adult: nil,
                    backdropPath: nil,
                    genreIDS: nil,
                    id: nil,
                    originalLanguage: nil,
                    originalTitle: nil,
                    overview: $0.overview,
                    popularity: nil,
                    posterPath: $0.posterPath,
                    releaseDate: $0.releaseDate,
                    video: nil,
                    voteAverage: $0.voteAverage,
                    voteCount: nil
                )
            }
            print("getAllMovies funciono")
            return movies
        } catch {
            print("Error al obtener movies: \(error)")
            return []
        }
    }
    
    
}

extension ListOfMoviesInteractor: ListOfMoviesInteractorPresenterProtocol {
    func deleteAllMovies(){
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Movie")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
            try context.save()
            print("Delete data for Movie")
        } catch {
            print("Error delete data: \(error)")
        }
    }
    
    func getListOfMovies(page: Int) {
        
        if !Internet.connectedToTheInternet() {
            let allMovies = getAllMovies()
            presenter?.setMovies(allMovies)
            presenter?.showErrorAlert(error: "Usando CoreData")
        } else {
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
    
}
