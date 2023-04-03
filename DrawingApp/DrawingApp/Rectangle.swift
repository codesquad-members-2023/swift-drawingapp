//
//  DRView.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

class Rectangle {
  private let id: ID
  
  private var size: Size
  
  private var origin: Point
  
  private var backgroundColor: Color
  
  init(id: ID, size: Size, origin: Point, backgroundColor: Color) {
    self.id = id
    self.size = size
    self.origin = origin
    self.backgroundColor = backgroundColor
  }
}

extension Rectangle: Equatable {
  static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
    lhs.id == rhs.id
  }
}

extension Rectangle: CustomStringConvertible {
  var description: String {
    "(\(id.description)), \(origin.description), \(size.description), \(backgroundColor.description)"
  }
}
