//
//  AlphaFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol AlphaFactory {
  func make() -> Color.Alpha?
}

class RandomAlphaFactory: AlphaFactory {
  func make() -> Color.Alpha? {
    Color.Alpha.allCases.randomElement()
  }
}
