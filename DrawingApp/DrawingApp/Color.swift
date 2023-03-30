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
    
    static func < (lhs: AlphaLevel, rhs: AlphaLevel) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }
  
  private let red: Float
  private let green: Float
  private let blue: Float
  private let alpha: AlphaLevel
  
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
