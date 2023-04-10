//
//  IDGenerator.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

class IDGenerator {
  
  static let defaultLength = [3, 3, 3]

  private let lengthPattern: [Int]
  
  init(lengthPattern: [Int] = defaultLength) {
    if lengthPattern.allSatisfy({ integer in integer > 0 }) {
      self.lengthPattern = lengthPattern
    } else {
      self.lengthPattern = Self.defaultLength
    }
  }
  
  private func makeRandomFigure() -> String {
    var tempID = UUID().uuidString
    var result: String = ""
    
    for (index, length) in lengthPattern.enumerated() {
      for _ in 0..<length {
        guard let char = tempID.popLast() else { break }
        result += String(char)
      }
      if index != lengthPattern.count - 1 { result.append("-") }
    }
    return result
  }
  
  func make() -> ID {
    let idString = makeRandomFigure()
    return ID(id: idString)
  }
}
