//
//  DRAlpha.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct DRAlpha: CustomStringConvertible {
  typealias Figure = Level
  
  enum Level: Int, CaseIterable {
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
  }
  
  private let level: Level
  
  init(level: Level) {
    self.level = level
  }
  
  // MARK: CustomStringConvertible
  
  var description: String {
    "Alpha: \(level.rawValue)"
  }
}
