//
//  RandomRGB.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/03.
//

import Foundation

class Rgb {
    private let red = Int.random(in: 0...255)
    private let green = Int.random(in: 0...255)
    private let blue = Int.random(in: 0...255)
}

extension Rgb: CustomStringConvertible {
    var description: String {
        return "R:\(red), G:\(green), B:\(blue)"
    }
}
