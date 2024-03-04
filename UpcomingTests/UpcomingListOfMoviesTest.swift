//
//  UpcomingListOfMoviesTest.swift
//  UpcomingTests
//
//  Created by dvarillc on 4/03/24.
//

import Foundation

import XCTest
import CoreData
@testable import Upcoming

class ListOfMoviesCallbackInteractorTests: XCTestCase {
    var sut: ListOfMoviesInteractor?
    let listOfMoviesMock = ListOfMoviesMock.getListOfMoviesExample()
    
    override func setUp() {
        super.setUp()
        sut = ListOfMoviesInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
        sut?.deleteAllMovies()
        sut = nil
    }
    
    func testGetAllMovies() {
        //given
        //when
        sut?.saveResponse(listOfMoviesMock)
        let movies = sut!.getAllMovies()
        
        //then
        XCTAssertFalse(movies.isEmpty, "La lista de películas no debe estar vacía")
    }
    
    func testSaveResponse() {
        //given
        //when
        sut?.saveResponse(listOfMoviesMock)
        let moviesIsEmpty = sut!.getAllMovies().isEmpty
        //then
        XCTAssertFalse(moviesIsEmpty, "La lista de películas no debe estar vacía")
        
    }
 
}

class ListOfMoviesInteractorTests: XCTestCase{
    
    var sut: ListOfMoviesInteractor?
    let listOfMoviesMock = ListOfMoviesMock.getListOfMoviesExample()
    
    override func setUp() {
        super.setUp()
        sut = ListOfMoviesInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
        sut?.deleteAllMovies()
        sut = nil
    }
    
    func testDeleteAllMovies() {
        // Ejecuta el método deleteAllMovies
        sut?.saveResponse(listOfMoviesMock)
        sut?.deleteAllMovies()
        let movies = sut!.getAllMovies()
        
        XCTAssertTrue(movies.isEmpty, "No debe haber ningún objeto Movie en Core Data después de borrar")
    }
}
