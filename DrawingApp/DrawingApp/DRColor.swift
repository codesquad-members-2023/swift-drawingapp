//
//  DRColor.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct DRColor: Randomizable, CustomStringConvertible {
  typealias Figure = UInt8
  
  private let red: Figure
  private let green: Figure
  private let blue: Figure
  
  init(r red: UInt8, g green: UInt8, b blue: UInt8) {
    self.red = red
    self.green = green
    self.blue = blue
  }
  
  var description: String {
    "R:\(red), G:\(green), B:\(blue)"
  }
  
  static func makeRandomFigure(range: ClosedRange<UInt8>? = nil) -> UInt8 {
    (0...UInt8.max).randomElement() ?? UInt8.min
  }
}
