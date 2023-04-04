//
//  RandomRGB.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/03.
//

import Foundation

class Rgb {
    let red = Int.random(in: 0...255)
    let green = Int.random(in: 0...255)
    let blue = Int.random(in: 0...255)
}

extension Rgb: CustomStringConvertible {
    var description: String {
        return "R:\(red), G:\(green), B:\(blue)"
    }
}
