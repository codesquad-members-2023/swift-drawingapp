//
//  ViewFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

protocol RectangleFactory: Factory where Product == Rectangle {
  var pointFactory: any PointFactory { get set }
  var colorFactory: any ColorFactory { get set }
  var alphaFactory: any AlphaFactory { get set }
}

class RandomRectangleFactory: RectangleFactory {
  var pointFactory: any PointFactory
  var colorFactory: any ColorFactory
  var alphaFactory: any AlphaFactory
  
  init(pointFactory: RandomPointFactory) {
    self.pointFactory = pointFactory
    self.colorFactory = RandomColorFactory()
    self.alphaFactory = RandomAlphaFactory()
  }
  
  private func makeRandomID() -> ID {
    let randomString = ID.makeRandomFigure()
    return .init(id: randomString)
  }
  
  func produce() -> Rectangle? {
    let id = makeRandomID()
    let size = Size(width: 150, height: 120)
    let position = pointFactory.produce() ?? Point(x: 0, y: 0)
    let color = colorFactory.produce() ?? Color(r: 0, g: 0, b: 0)
    let alpha = alphaFactory.produce() ?? Alpha(level: .lv10)
    return .init(id: id, size: size, position: position, backgroundColor: color, alpha: alpha)
  }
}
