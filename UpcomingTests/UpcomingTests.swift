//
//  UpcomingTests.swift
//  UpcomingTests
//
//  Created by dvarillc on 3/03/24.
//

import XCTest
@testable import Upcoming

final class PrePostulacionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setUP")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("tearDown")
    }

    func testValidationUserInput() throws {
        XCTAssertTrue(Validations.minLength("holaa", min: 4))
    }
    
    func testValidationUserInput2() throws {
        XCTAssertTrue(Validations.minLength("holaaaa", min: 4))
    }
}
