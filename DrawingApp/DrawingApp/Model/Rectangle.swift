//
//  Rectangle.swift
//  DrawingApp
//
//  Created by ilim on 2023/03/31.
//

import Foundation

class Rectangle {
    private var id: Id
    private var size: Size
    private var coordinate: Coordinate
    private var color: Rgb
    private var alpha: Alpha
    
    init(id: Id, size: Size, coordinate: Coordinate, color: Rgb, alpha: Alpha) {
        self.id = id
        self.size = size
        self.coordinate = coordinate
        self.color = color
        self.alpha = alpha
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String {
        return "\(id), \(coordinate), \(size), \(color), \(alpha)"
    }
}
