//
//  RectangleFactory.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/02.
//

import Foundation

class RectangleFactory {

    func makeRectangle(viewWidth: Double, viewHeight: Double) -> Rectangle {
        let id = Id()
        let size = Size()
        let coordinate = Coordinate(width: viewWidth, height: viewHeight)
        let rgb = Rgb()
        let alpha = Alpha()
        
        return Rectangle(id: id, size: size, coordinate: coordinate, color: rgb, alpha: alpha)
    }
}
