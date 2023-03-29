//
//  DRPoint.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct Point {
  private let x: Double
  private let y: Double
  
  init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
}

extension Point: CustomStringConvertible {
  var description: String {
    "X: \(Int(x)), Y: \(Int(y))"
  }
}
