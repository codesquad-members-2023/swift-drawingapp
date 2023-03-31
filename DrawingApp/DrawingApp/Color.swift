//
//  Color.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

class Color {
    private var red : Int
    private var green : Int
    private var blue : Int
    
    init(red: Int , green: Int , blue : Int) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
}

extension Color : CustomStringConvertible {
    var description: String {
        return "R : \(self.red), G : \(self.green), B : \(self.blue)"
    }
}
