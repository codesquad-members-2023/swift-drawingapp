//
//  RandomColorFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/06.
//

import Foundation

class RandomColorFactory: ColorFactory {
  var alphaFactory: AlphaFactory
  
  init(alphaFactory: AlphaFactory = RandomAlphaFactory()) {
    self.alphaFactory = alphaFactory
  }
  
  private func generateRandomFloat() -> Float {
    Float.random(in: (0.0 ... 1.0))
  }
  
  func make() -> Color? {
    let r = generateRandomFloat()
    let g = generateRandomFloat()
    let b = generateRandomFloat()
    guard let alpha = alphaFactory.make() else { return nil }
    return .init(r: r, g: g, b: b, alpha: alpha)
  }
}
