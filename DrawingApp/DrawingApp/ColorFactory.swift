//
//  ColorFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol ColorFactory {
  var alphaFactory: AlphaFactory { get set }
  
  func make() -> Color?
}

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
