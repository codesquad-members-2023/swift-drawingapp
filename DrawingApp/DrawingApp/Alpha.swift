//
//  DRAlpha.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct Alpha: CustomStringConvertible, Randomizable {
  enum Level: Int, CaseIterable, Comparable {
    case lv1 = 1
    case lv2
    case lv3
    case lv4
    case lv5
    case lv6
    case lv7
    case lv8
    case lv9
    case lv10
    
    static func < (lhs: Alpha.Level, rhs: Alpha.Level) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }
  
  typealias Figure = Level
  
  private let level: Level
  
  init(level: Level) {
    self.level = level
  }
  
  // MARK: CustomStringConvertible
  
  var description: String {
    "Alpha: \(level.rawValue)"
  }
  
  static func makeRandomFigure(range: ClosedRange<Figure>? = nil) -> Figure {
    Figure.allCases.randomElement() ?? .lv10
  }
}
