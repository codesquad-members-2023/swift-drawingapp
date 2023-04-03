//
//  ViewFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

protocol RectangleFactory {
  var idGenerator: IDGenerator { get set }
  var pointFactory: PointFactory { get set }
  var colorFactory: ColorFactory { get set }
  
  func produce() -> Rectangle?
}

class RandomRectangleFactory: RectangleFactory {
  var idGenerator: IDGenerator
  var pointFactory: PointFactory
  var colorFactory: ColorFactory
  
  init(pointFactory: RandomPointFactory) {
    self.idGenerator = IDGenerator()
    self.pointFactory = pointFactory
    self.colorFactory = RandomColorFactory()
  }
  
  func produce() -> Rectangle? {
    let id = idGenerator.generate()
    let size = Size(width: 150, height: 120)
    let position = pointFactory.produce() ?? Point(x: 0, y: 0)
    let color = colorFactory.produce() ?? Color(r: 0, g: 0, b: 0, alpha: .lv10)
    return .init(id: id, size: size, origin: position, backgroundColor: color)
  }
}
