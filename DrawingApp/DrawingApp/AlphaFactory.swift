//
//  AlphaFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol AlphaFactory {
  func make() -> Color.AlphaLevel?
}

class RandomAlphaFactory: AlphaFactory {
  func make() -> Color.AlphaLevel? {
    Color.AlphaLevel.allCases.randomElement()
  }
}
