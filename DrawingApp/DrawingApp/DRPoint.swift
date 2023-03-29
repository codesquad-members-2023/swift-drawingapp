//
//  DRPoint.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct DRPoint: CustomStringConvertible {
  private let x: Double
  private let y: Double
  
  init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
  
  var description: String {
    "X: \(Int(x)), Y: \(Int(y))"
  }
  
  static func makeRandomFigure(upperBound: Double) -> Double {
    return Double.random(in: (0 ... upperBound))
  }
}
