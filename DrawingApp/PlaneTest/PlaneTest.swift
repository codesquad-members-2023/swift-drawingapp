//
//  PlaneTest.swift
//  PlaneTest
//
//  Created by SONG on 2023/04/06.
//

import XCTest

final class PlaneTest: XCTestCase {
    var test : Plane!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }

    override func tearDownWithError() throws {
        test = nil
        try super.tearDownWithError()

    }
    
    func testAdd_OneSquare() {
           test = Plane() // []
           test.add(MockSquare()) //
           XCTAssertNotNil(test[0])
       }
       
       func testCount_Zero() {
           test = Plane()
           XCTAssertTrue(test.count() == 0)
       }
       
       func testCount_Three() {
           test = Plane()
           for _ in 0...2 {
               test.add(MockSquare())
           }
           XCTAssertTrue(test.count() == 3)
       }
       
       func testIsThereSquareIncludedCoordinate_When_x100_y50() {
           test = Plane()
           test.add(MockSquare()) // origin = 0,0

           XCTAssertTrue(test.whichIndexOfSquareisIncludedCoordinate(point: CGPoint(x: 100, y: 50)) == 0)
       }

       func testIsThereSquareIncludedCoordinate_When_x300_y500() {
           test = Plane()
           test.add(MockSquare()) // origin = 0,0

           XCTAssertNil(test.whichIndexOfSquareisIncludedCoordinate(point: CGPoint(x: 300, y: 500)))
       }
}

protocol Square {
    var id : ID { get }
    var size : Size { get }
    var position : Position { get }
    var backgroundColor : Color { get set }
    var alpha : Alpha { get set}
    var description : String { get }
    
    func manufacturing() -> MaterialOfSquareView
}

struct ID {
    
}

struct Size{
    
}

struct Position {
    let x = 0.0
    let y = 0.0
    
    func isCoordinateContained(point: CGPoint)-> Bool {
        let x = Double(point.x)
        let y = Double(point.y)
        let xRange = self.x...self.x + 150 // 150 = width
        let yRange = self.y...self.y + 120 // 120 = height
        
        return xRange.contains(x) && yRange.contains(y)
    }
}

struct Color {
    func convert()-> [CGFloat]{
        return [0,0,0]
    }
}

struct Alpha{
    func convert()-> CGFloat{
        return 0
    }
}

struct MaterialOfSquareView {
    
}

class MockSquare : Square{
    var id = ID()
    var size = Size()
    var position = Position()
    var backgroundColor = Color()
    var alpha = Alpha()
    var description: String = ""
    
    func manufacturing() -> MaterialOfSquareView{
        return MaterialOfSquareView()
    }
}

