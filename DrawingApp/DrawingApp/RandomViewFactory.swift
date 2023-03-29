//
//  RandomViewFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

class RandomViewFactory: ViewFactory {
  private let xRange: ClosedRange<Double>
  
  private let yRange: ClosedRange<Double>
  
  init(xRange: ClosedRange<Double>, yRange: ClosedRange<Double>) {
    self.xRange = xRange
    self.yRange = yRange
  }
  
  private func makeRandomID() -> DRID {
    let randomString = DRID.makeRandomFigure()
    return .init(id: randomString)
  }
  
  private func makeRandomPosition() -> DRPoint {
    let x = DRPoint.makeRandomFigure(range: xRange)
    let y = DRPoint.makeRandomFigure(range: yRange)
    return .init(x: x, y: y)
  }
  
  private func makeRandomColor() -> DRColor {
    let r = DRColor.makeRandomFigure()
    let g = DRColor.makeRandomFigure()
    let b = DRColor.makeRandomFigure()
    return .init(r: r, g: g, b: b)
  }
  
  private func makeRandomAlpha() -> DRAlpha {
    let level = DRAlpha.makeRandomFigure()
    return .init(level: level)
  }
  
  // MARK: ViewFactory
  
  func makeView() -> DRView? {
      let id = makeRandomID()
      let size = DRSize(width: 150, height: 120)
      let position = makeRandomPosition()
      let color = makeRandomColor()
      let alpha = makeRandomAlpha()
    return .init(id: id, size: size, position: position, backgroundColor: color, alpha: alpha)
  }
}
