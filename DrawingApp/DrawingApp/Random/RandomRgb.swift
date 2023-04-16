//
//  RandomRGB.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/03.
//

import Foundation

class Rgb {
    let red = CGFloat.random(in: 0...255)
    let green = CGFloat.random(in: 0...255)
    let blue = CGFloat.random(in: 0...255)
}

extension Rgb: CustomStringConvertible {
    var description: String {
        return "R:\(red), G:\(green), B:\(blue)"
    }
}

extension Rgb {
    var hexColor: String {
        let hexRed = String(format: "%02X", Int(red))
        let hexGreen = String(format: "%02X", Int(green))
        let hexBlue = String(format: "%02X", Int(blue))
        return "\(hexRed)\(hexGreen)\(hexBlue)"
    }
}
