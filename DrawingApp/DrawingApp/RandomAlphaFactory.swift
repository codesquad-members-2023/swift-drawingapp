//
//  RandomAlphaFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/06.
//

import Foundation

class RandomAlphaFactory: AlphaFactory {
  func make() -> Color.Alpha? {
    Color.Alpha.allCases.randomElement()
  }
}
