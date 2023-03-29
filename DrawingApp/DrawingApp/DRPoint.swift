//
//  DRPoint.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct DRPoint: Randomizable, CustomStringConvertible {
  typealias Figure = Double
  
  private let x: Figure
  private let y: Figure
  
  init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
  
  // MARK: CustomStringConvertible
  
  var description: String {
    "X: \(Int(x)), Y: \(Int(y))"
  }
  
  // MARK: Randomizable
  
  static func makeRandomFigure(range: ClosedRange<Figure>?) -> Figure {
    guard let range else { return 0 }
    return Double.random(in: range)
  }
}
