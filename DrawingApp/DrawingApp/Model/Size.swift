//
//  Size.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/04.
//

import Foundation

class Size {
    let width: Double
    let height: Double
    
    init() {
        self.width = 150
        self.height = 120
    }
}

extension Size: CustomStringConvertible {
    var description: String {
        return "W\(Int(width)), H\(Int(height))"
    }
}
