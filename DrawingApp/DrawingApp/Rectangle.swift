//
//  Rectangle.swift
//  DrawingApp
//
//  Created by PJB on 2023/04/03.
//

import Foundation
protocol AbstractShapeFactory {
    func creatRectangle() -> ShapeProperties
}

class RandomShapeFactory: AbstractShapeFactory {
    func creatRectangle() -> ShapeProperties {
        let id = ID().createID()
        let size = Size(width: 150, height: 120)
        let point = randomPosition()
        let color = Color()
        let alpha = Alpha.createRandomAlpha()
        
        return Rectangle(id: id, size: size, point: point, color: color, alpha: alpha)
    }
}

protocol ShapeProperties: CustomStringConvertible {
    var id: String { get }
    var size: Size { get }
    var point: Point { get }
    var color: Color { get }
    var alpha: Int { get }
}

class Rectangle: ShapeProperties {
    var description: String {
        return "\(id), \(size), \(point), \(color), \(alpha)"
    }
    
    var id: String
    var size: Size
    var point: Point
    var color: Color
    var alpha: Int
    
    init(id: String, size: Size, point: Point, color: Color, alpha: Int) {
        self.id = id
        self.size = size
        self.point = point
        self.color = color
        self.alpha = alpha
    }
}
