//
//  DrawingAppTests.swift
//  DrawingAppTests
//
//  Created by ilim on 2023/04/05.
//

import XCTest
@testable import DrawingApp

final class DrawingAppTests: XCTestCase {
    private var sut: Id!
    
    override func setUpWithError() throws {
        sut = Id()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testId() -> Int {
        return sut.createRandomString().count
    }

    func testPerformanceExample() throws {
        XCTAssertEqual(testId(), 11)
    }
}
