//
//  DRView.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

class Rectangle {
  let id: ID
  
  var size: Size
  
  var origin: Point
  
  var backgroundColor: Color
  
  init(id: ID, size: Size, origin: Point, backgroundColor: Color) {
    self.id = id
    self.size = size
    self.origin = origin
    self.backgroundColor = backgroundColor
  }
}

extension Rectangle: Equatable {
  static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
    lhs.id == rhs.id
  }
}

extension Rectangle: CustomStringConvertible {
  var description: String {
    "(\(id.description)), \(origin.description), \(size.description), \(backgroundColor.description)"
  }
}

extension Rectangle {
  func areaContains(_ point: Point) -> Bool {
    let (xRange, yRange) = size.getArea(fromOrigin: origin)
    return point.x.isOn(range: xRange) && point.y.isOn(range: yRange)
  }
}

extension Rectangle {
  func setAlpha(to newValue: Float) {
    let newAlpha = Color.Alpha.init(floatValue: newValue)
    backgroundColor.alpha = newAlpha ?? .level10
  }
}
