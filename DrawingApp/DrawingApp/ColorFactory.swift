//
//  ColorFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol ColorFactory {
  func produce() -> Color?
}

class RandomColorFactory: ColorFactory {
  func produce() -> Color? {
    let r = UInt8.random(in: (0...UInt8.max))
    let g = UInt8.random(in: (0...UInt8.max))
    let b = UInt8.random(in: (0...UInt8.max))
    return .init(r: r, g: g, b: b)
  }
}
