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
    
    
}
