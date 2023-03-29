//
//  DRPoint.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct Point {
  typealias Figure = Double
  
  private let x: Figure
  private let y: Figure
  
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

extension Point: Randomizable {
  static func makeRandomFigure(range: ClosedRange<Figure>?) -> Figure {
    guard let range else { return 0 }
    return Double.random(in: range)
  }
}
