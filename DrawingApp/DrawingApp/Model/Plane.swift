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
  
  private var selectedRectangle: Rectangle?
  
  var count: Int {
    rectangles.count
  }
  
  init(size: Size) {
    self.size = size
    self.rectangles = []
    self.selectedRectangle = nil
  }
  
  subscript(index: Int) -> Rectangle? {
    guard (0..<count).contains(index) else { return nil }
    return rectangles[index]
  }
  
  mutating func add(rect: Rectangle) {
    rectangles.append(rect)
    NotificationCenter.default.post(name: .newRectangleHasBeenAdded,
                                    object: nil,
                                    userInfo: [Notification.UserInfoKey.newRect: rect])
  }
  
  private func contains(point: Point) -> Bool {
    let (xRange, yRange) = size.getArea(fromOrigin: Point(x: 0, y: 0))
    return point.x.isOn(range: xRange) && point.y.isOn(range: yRange)
  }
  
  private func findRectangles(containing point: Point) -> [Rectangle] {
    guard self.contains(point: point) else { return [] }
    return rectangles.filter { rect in rect.areaContains(point) }
  }
  
  mutating func selectRectangle(on point: Point) {
    let rect = findRectangles(containing: point).last
    selectedRectangle = rect
    
    guard let selectedRectangle else {
      NotificationCenter.default.post(name: .deselectRectangle, object: nil)
      return
    }
    NotificationCenter.default.post(name: .selectRectangle,
                                    object: nil,
                                    userInfo: [Notification.UserInfoKey.newRect: selectedRectangle])
  }
  
  func setSelectedRectangle(withColor newColor: Color) {
    selectedRectangle?.setColor(to: newColor)
  }
  
  func setSelectedRectangle(withAlpha newValue: Float) {
    selectedRectangle?.setAlpha(to: newValue)
  }
}
