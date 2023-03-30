//
//  ColorFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol ColorFactory {
  var alphaFactory: AlphaFactory { get set }
  
  func produce() -> Color?
}

class RandomColorFactory: ColorFactory {
  var alphaFactory: AlphaFactory
  
  init(alphaFactory: AlphaFactory = RandomAlphaFactory()) {
    self.alphaFactory = alphaFactory
  }
  
  private func generateRandomFloat() -> Float {
    Float.random(in: (0.0 ... 1.0))
  }
  
  func produce() -> Color? {
    let r = generateRandomFloat()
    let g = generateRandomFloat()
    let b = generateRandomFloat()
    let alpha = alphaFactory.produce() ?? Color.AlphaLevel.lv10
    return .init(r: r, g: g, b: b, alpha: alpha)
  }
}
