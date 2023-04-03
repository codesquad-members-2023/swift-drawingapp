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
    
    func convert()-> [CGFloat] {
        let red : CGFloat = CGFloat(Double(self.red) / 255)
        let green : CGFloat = CGFloat(Double(self.green) / 255)
        let blue : CGFloat = CGFloat(Double(self.blue) / 255)

        return [red,green,blue]
    }
    
}

extension Color : CustomStringConvertible {
    var description: String {
        return "R : \(self.red), G : \(self.green), B : \(self.blue)"
    }
}
