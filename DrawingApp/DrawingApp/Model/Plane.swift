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
    
    func changeBackgroundColor(index: Int) -> UIColor {
        let backgroundColor: Rgb = .init()
        rectangles[index].color = backgroundColor
        return setUiColor(color: backgroundColor, alpha: rectangles[index].alpha)
    }
    
    func getUiViewIndex(x: Double, y: Double) -> Int {
        var xRange: ClosedRange<Double>
        var yRange: ClosedRange<Double>
        var lastIndex = -1
        
        for index in 0 ..< countOfRectangles {
            xRange = rectangles[index].coordinate.x...(rectangles[index].coordinate.x + rectangles[index].size.width)
            yRange = rectangles[index].coordinate.y...(rectangles[index].coordinate.y + rectangles[index].size.height)
            if xRange.contains(x) && yRange.contains(y) { lastIndex = index }
        }
        
        return lastIndex
    }
    
    func changeAlpha(index: Int, alpha: Double) -> UIColor {
        rectangles[index].alpha.alpha = alpha
        return setUiColor(color: rectangles[index].color, alpha: rectangles[index].alpha)
    }
    
    func setUiColor(color: Rgb, alpha: Alpha) -> UIColor {
        return uiColor.convertCodeToColor(color, alpha)
    }
}
