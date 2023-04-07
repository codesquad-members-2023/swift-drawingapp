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
    
}

struct Alpha{
    
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

