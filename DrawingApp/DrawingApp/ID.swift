//
//  DRID.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct ID {
  
  typealias Figure = String

  private let id: Figure
  
  init(id: String) {
    self.id = id
  }
}

extension ID: Equatable {
  static func == (lhs: ID, rhs: ID) -> Bool {
    lhs.id == rhs.id
  }
}

extension ID: CustomStringConvertible {
  var description: String {
    id
  }
}

extension ID: Randomizable {
  static private let componentLength = [3, 3, 3]
  
  static func makeRandomFigure(range: ClosedRange<Figure>? = nil) -> Figure {
    var tempID = UUID().uuidString
    var result: String = ""
    
    for (index, length) in componentLength.enumerated() {
      for _ in 0..<length {
        guard let char = tempID.popLast() else { break }
        result += String(char)
      }
      if index != componentLength.count - 1 { result.append("-") }
    }
    return result
  }
}

