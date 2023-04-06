//
//  PointFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol PointFactory {
  func make() -> Point?
  func makeOrigin(consideringSize size: Size) -> Point?
}

class RandomPointFactory: PointFactory {
  
  private let xRange: ClosedRange<Double>
  private let yRange: ClosedRange<Double>
  
  init(xRange: ClosedRange<Double>, yRange: ClosedRange<Double>) {
    self.xRange = xRange
    self.yRange = yRange
  }
  
  func make() -> Point? {
    let x = Double.random(in: xRange)
    let y = Double.random(in: yRange)
    return .init(x: x, y: y)
  }
  
  func makeOrigin(consideringSize size: Size) -> Point? {
    let newXUpperBound = xRange.upperBound - size.width
    let newYUpperBound = yRange.upperBound - size.height
    let newXRange = (xRange.lowerBound ... newXUpperBound)
    let newYRange = (yRange.lowerBound ... newYUpperBound)
    
    let x = Double.random(in: newXRange)
    let y = Double.random(in: newYRange)
    return .init(x: x, y: y)
  }
}
