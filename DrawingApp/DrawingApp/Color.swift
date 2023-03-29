//
//  DRColor.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct Color {
  private let red: UInt8
  private let green: UInt8
  private let blue: UInt8
  
  init(r red: UInt8, g green: UInt8, b blue: UInt8) {
    self.red = red
    self.green = green
    self.blue = blue
  }
}

extension Color: CustomStringConvertible {
  var description: String {
    "R:\(red), G:\(green), B:\(blue)"
  }
}
