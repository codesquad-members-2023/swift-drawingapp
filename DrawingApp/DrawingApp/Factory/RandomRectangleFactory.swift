//
//  RandomRectangleFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/06.
//

import Foundation

class RandomRectangleFactory: RectangleFactory {
  var idGenerator: IDGenerator
  var pointFactory: PointFactory
  var colorFactory: ColorFactory
  
  init(pointFactory: RandomPointFactory) {
    self.idGenerator = IDGenerator()
    self.pointFactory = pointFactory
    self.colorFactory = RandomColorFactory()
  }
  
  func make() -> Rectangle? {
    let id = idGenerator.make()
    let size = Size(width: 150, height: 120)
    let position = pointFactory.makeOrigin(consideringSize: size) ?? Point(x: 0, y: 0)
    let color = colorFactory.make() ?? Color(r: 0, g: 0, b: 0, alpha: .level10)
    return .init(id: id, size: size, origin: position, backgroundColor: color)
  }
}
