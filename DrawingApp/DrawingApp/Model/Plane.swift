//
//  Plane.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/03.
//

import Foundation

struct Plane {
  private let size: Size
  
  private var rectangles: [Rectangle]
  
  var count: Int {
    rectangles.count
  }
  
  init(size: Size) {
    self.size = size
    self.rectangles = []
  }
  
  subscript(index: Int) -> Rectangle? {
    guard (0..<count).contains(index) else { return nil }
    return rectangles[index]
  }
  
  private func contains(point: Point) -> Bool {
    let (xRange, yRange) = size.getArea(fromOrigin: Point(x: 0, y: 0))
    return point.x.isOn(range: xRange) && point.y.isOn(range: yRange)
  }
  
  func findRectangles(containing point: Point) -> [Rectangle] {
    guard self.contains(point: point) else { return [] }
    return rectangles.filter { rect in rect.areaContains(point) }
  }
  
  mutating func add(rect: Rectangle) {
    rectangles.append(rect)
  }
}
