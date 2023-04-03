//
//  DRColor.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct Color {
  enum AlphaLevel: Int, CaseIterable, Comparable {
    case lv1 = 1
    case lv2 = 2
    case lv3 = 3
    case lv4 = 4
    case lv5 = 5
    case lv6 = 6
    case lv7 = 7
    case lv8 = 8
    case lv9 = 9
    case lv10 = 10
    
    var floatValue: Float {
      Float(self.rawValue) / Float(10)
    }
    
    static func < (lhs: AlphaLevel, rhs: AlphaLevel) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }
  
  let red: Float
  let green: Float
  let blue: Float
  var alpha: AlphaLevel
  
  init(r red: Float, g green: Float, b blue: Float, alpha: AlphaLevel) {
    self.red = red
    self.green = green
    self.blue = blue
    self.alpha = alpha
  }
}

extension Color: CustomStringConvertible {
  var description: String {
    "R:\(red), G:\(green), B:\(blue), Alpha: \(alpha.rawValue)"
  }
}

extension Color {
  var hexDescription: String {
    let fixedRed = Int(Float(255) * red)
    let fixedGreen = Int(Float(255) * green)
    let fixedBlue = Int(Float(255) * blue)
    
    let redHex = String(format: "%02X", fixedRed)
    let greenHex = String(format: "%02X", fixedGreen)
    let blueHex = String(format: "%02X", fixedBlue)
    return "\(redHex)\(greenHex)\(blueHex)"
  }
}

extension Color.AlphaLevel {
  init(floatValue: Float) {
    let matchingLevel = Int(floatValue)
    self = Self.init(rawValue: matchingLevel) ?? .lv10
  }
}
