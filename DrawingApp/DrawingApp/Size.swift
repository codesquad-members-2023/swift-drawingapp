//
//  DRSize.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct Size: Randomizable, CustomStringConvertible {
  typealias Figure = Double
  
  private let width: Figure
  private let height: Figure
  
  init(width: Double, height: Double) {
    self.width = width
    self.height = height
  }
  
  // MARK: CustomStringConvertible
  
  var description: String {
    "W\(Int(width)), H\(Int(height))"
  }
  
  // MARK: Randomizable
  
  static func makeRandomFigure(range: ClosedRange<Figure>?) -> Figure {
    guard let range else { return 100 }
    return Double.random(in: range)
  }
}
