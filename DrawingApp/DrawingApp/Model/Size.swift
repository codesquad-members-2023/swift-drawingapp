//
//  DRSize.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct Size {
  let width: Double
  let height: Double
  
  init(width: Double, height: Double) {
    self.width = width
    self.height = height
  }
}

extension Size: CustomStringConvertible {
  var description: String {
    "W\(Int(width)), H\(Int(height))"
  }
}

extension Size {
  func getArea(fromOrigin origin: Point) -> (xRange: ClosedRange<Double>, yRange: ClosedRange<Double>) {
    let xRange = origin.x.getRange(withLength: width)
    let yRange = origin.y.getRange(withLength: height)
    return (xRange, yRange)
  }
}
