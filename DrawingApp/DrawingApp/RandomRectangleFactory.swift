//
//  RandomViewFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

class RandomRectangleFactory: RectangleFactory {
  private let xRange: ClosedRange<Double>
  
  private let yRange: ClosedRange<Double>
  
  init(xRange: ClosedRange<Double>, yRange: ClosedRange<Double>) {
    self.xRange = xRange
    self.yRange = yRange
  }
  
  private func makeRandomID() -> ID {
    let randomString = ID.makeRandomFigure()
    return .init(id: randomString)
  }
  
  private func makeRandomPosition() -> Point {
    let x = Point.makeRandomFigure(range: xRange)
    let y = Point.makeRandomFigure(range: yRange)
    return .init(x: x, y: y)
  }
  
  private func makeRandomColor() -> Color {
    let r = Color.makeRandomFigure()
    let g = Color.makeRandomFigure()
    let b = Color.makeRandomFigure()
    return .init(r: r, g: g, b: b)
  }
  
  private func makeRandomAlpha() -> Alpha {
    let level = Alpha.makeRandomFigure()
    return .init(level: level)
  }
  
  // MARK: ViewFactory
  
  func makeRectangle() -> Rectangle? {
      let id = makeRandomID()
      let size = Size(width: 150, height: 120)
      let position = makeRandomPosition()
      let color = makeRandomColor()
      let alpha = makeRandomAlpha()
    return .init(id: id, size: size, position: position, backgroundColor: color, alpha: alpha)
  }
}
