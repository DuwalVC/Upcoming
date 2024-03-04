//
//  NetworkingListOfMovies.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

class ServicesClientHTTPListOfMovie: ClientHTTP{
    init() {
        super.init(domain: "https://api.themoviedb.org")
    }
    
    func getListOfMovies(page: Int) async throws -> ListOfMovies {
        let params = ParametersFunctionRequest(url: "/3/movie/upcoming?language=en-US&page=\(page)", token: true)
        let response = try await request(params, type: ListOfMovies.self)
        return response
    }
}
