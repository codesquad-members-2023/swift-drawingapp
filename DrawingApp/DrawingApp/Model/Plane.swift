//
//  Plane.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/04.
//

import UIKit

struct Plane {
    private var rectangles = [Rectangle]()
    private var uiColor = RgbToUIColor()
    var countOfRectangles: Int {
        return rectangles.count
    }
    
    subscript(index: Int) -> Rectangle? {
        return countOfRectangles > 0 && index >= 0 ? rectangles[index] : nil
    }
    
    mutating func addRectangle(rectangle: Rectangle) {
        rectangles.append(rectangle)
    }
    
    func makeUiView(rect: Rectangle) -> UIView {
        let rectangle: CGRect = .init(x: rect.coordinate.x, y: rect.coordinate.y, width: rect.size.width, height: rect.size.height)
        let rectangleView: UIView = .init(frame: rectangle)
        let rgba = setUiColor(color: rect.color, alpha: rect.alpha)
        rectangleView.backgroundColor = rgba
        return rectangleView
    }
}
