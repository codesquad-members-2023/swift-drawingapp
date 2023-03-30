//
//  AlphaFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol AlphaFactory {
  func produce() -> Color.AlphaLevel?
}

class RandomAlphaFactory: AlphaFactory {
  func produce() -> Color.AlphaLevel? {
    Color.AlphaLevel.allCases.randomElement()
  }
}
