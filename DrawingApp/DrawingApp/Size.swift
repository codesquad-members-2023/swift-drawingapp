//
//  Size.swift
//  DrawingApp
//
//  Created by PJB on 2023/04/03.
//

import Foundation
class Size: CustomStringConvertible {
    private var width: Double
    private var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    var description: String {
        return "Width: \(width), Height: \(height)"
    }
}
