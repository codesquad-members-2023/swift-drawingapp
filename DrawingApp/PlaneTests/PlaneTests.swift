//
//  PlaneTests.swift
//  PlaneTests
//
//  Created by ilim on 2023/04/15.
//

import XCTest

final class PlaneTests: XCTestCase {
    var sut: Plane!
    var validRectangle: Rectangle!
    var invalidRectangle: Rectangle!
    
    override func setUpWithError() throws {
        sut = Plane()
        validRectangle = RectangleFactory().makeRectangle(viewWidth: 200, viewHeight: 200)
        invalidRectangle = RectangleFactory().makeRectangle(viewWidth: 150, viewHeight: 150)
        
        validRectangle.coordinate.x = 0
        validRectangle.coordinate.y = 0
        invalidRectangle.coordinate.x = 50
        invalidRectangle.coordinate.y = 50
        sut.addRectangle(rectangle: validRectangle)
        sut.addRectangle(rectangle: invalidRectangle)
    }

    override func tearDownWithError() throws {
        sut = nil
        validRectangle = nil
        invalidRectangle = nil
    }


    func test_Plane_사각형을추가했을때_배열의갯수가올바르게반환되는지() throws {
        XCTAssertEqual(sut.countOfRectangles, 2)
    }
    
    func test_Plane_유효한좌표가주어지면_좌표에해당하는사각형의인덱스가반환되는지() throws {
        let index = sut.getUiviewIndex(x: 45, y: 45)
        XCTAssertEqual(index, 0)
    }
    
    func test_Plane_유효하지않은좌표가주어지면_minus1이반환되는지() throws {
        let index = sut.getUiviewIndex(x: 300, y: 300)
        XCTAssertEqual(index, -1)
    }
    
    func test_Plane_유효한좌표를만족하는사각형이여러개일때_마지막사각형의인덱스가반환되는지() throws {
        let index = sut.getUiviewIndex(x: 55, y: 60)
        XCTAssertEqual(index, 1)
    }
    
    func test_Plane_subscript인덱스에음수가입력되면_nil이반환되는지() {
        let rectangle = sut[-1]
        XCTAssertNil(rectangle)
    }
    


}
