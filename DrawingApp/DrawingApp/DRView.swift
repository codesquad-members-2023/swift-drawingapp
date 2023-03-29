//
//  DRView.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

class DRView: Equatable, CustomStringConvertible {
  private let id: DRID
  
  private var size: DRSize
  
  private var position: DRPoint
  
  private var backgroundColor: DRColor
  
  private var alpha: DRAlpha
  
  init(id: DRID, size: DRSize, position: DRPoint, backgroundColor: DRColor, alpha: DRAlpha) {
    self.id = id
    self.size = size
    self.position = position
    self.backgroundColor = backgroundColor
    self.alpha = alpha
  }
  
  // MARK: Equatable
  
  static func == (lhs: DRView, rhs: DRView) -> Bool {
    lhs.id == rhs.id
  }
  
  // MARK: CustomStringConvertible
  
  var description: String {
    "(\(id.description)), \(position.description), \(size.description), \(backgroundColor.description), \(alpha.description)"
  }
}
