//
//  DRColor.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct Color {
  enum Alpha: Int, CaseIterable, Comparable {
    case level1 = 1
    case level2 = 2
    case level3 = 3
    case level4 = 4
    case level5 = 5
    case level6 = 6
    case level7 = 7
    case level8 = 8
    case level9 = 9
    case level10 = 10
    
    var floatValue: Float {
      Float(self.rawValue) / Float(10)
    }
    
    static func < (lhs: Alpha, rhs: Alpha) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }
  
  let red: Float
  let green: Float
  let blue: Float
  var alpha: Alpha
  
  init(r red: Float, g green: Float, b blue: Float, alpha: Alpha) {
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

extension Color.Alpha {
  init(floatValue: Float) {
    let matchingLevel = Int(floatValue * 10)
    self = Self.init(rawValue: matchingLevel) ?? .level10
  }
}
