//
//  AlphaFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol AlphaFactory {
  func produce() -> Alpha?
}

class RandomAlphaFactory: AlphaFactory {
  func produce() -> Alpha? {
    let level = Alpha.Level.allCases.randomElement() ?? .lv10
    return Alpha(level: level)
  }
}
