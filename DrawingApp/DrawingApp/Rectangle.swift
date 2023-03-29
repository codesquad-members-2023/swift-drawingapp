//
//  DRView.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

class Rectangle: Equatable, CustomStringConvertible {
  private let id: ID
  
  private var size: Size
  
  private var position: Point
  
  private var backgroundColor: Color
  
  private var alpha: Alpha
  
  init(id: ID, size: Size, position: Point, backgroundColor: Color, alpha: Alpha) {
    self.id = id
    self.size = size
    self.position = position
    self.backgroundColor = backgroundColor
    self.alpha = alpha
  }
  
  // MARK: Equatable
  
  static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
    lhs.id == rhs.id
  }
  
  // MARK: CustomStringConvertible
  
  var description: String {
    "(\(id.description)), \(position.description), \(size.description), \(backgroundColor.description), \(alpha.description)"
  }
}
