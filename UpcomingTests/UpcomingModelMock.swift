//
//  UpcomingModelMock.swift
//  UpcomingTests
//
//  Created by dvarillc on 4/03/24.
//

import Foundation
@testable import Upcoming

struct ListOfMoviesMock {
    static func getEmptyModel() -> ListOfMovies {
        return ListOfMovies(
            dates: Dates(maximum: "", minimum: ""),
            page: 0,
            results: [],
            totalPages: 0,
            totalResults: 0
        )
    }
    
    static func getListOfMoviesExample() -> ListOfMovies{
        return ListOfMovies(
            dates: Dates(maximum: "2024-03-27", minimum: "2024-03-06"),
            page: 1,
            results: [
                Result(
                    title: "Turning Red",
                    adult: false,
                    backdropPath: "/47SVqaO02doJ06tOmrjiWDkwU3T.jpg",
                    genreIDS: [28, 53],
                    id: 1,
                    originalLanguage: "en",
                    originalTitle: "Radical",
                    overview: "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.",
                    popularity: 1.0,
                    posterPath: "/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg",
                    releaseDate: "2022-03-10",
                    video: false,
                    voteAverage: 6.1,
                    voteCount: 130
                ),
                Result(
                    title: "Turning Red 2",
                    adult: false,
                    backdropPath: "/47SVqaO02doJ06tOmrjiWDkwU3T.jpg",
                    genreIDS: [28, 53],
                    id: 1,
                    originalLanguage: "en",
                    originalTitle: "Radical",
                    overview: "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.",
                    popularity: 1.0,
                    posterPath: "/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg",
                    releaseDate: "2022-03-10",
                    video: false,
                    voteAverage: 6.1,
                    voteCount: 130
                )
            ],
            totalPages: 49,
            totalResults: 961
        )
    }
}
