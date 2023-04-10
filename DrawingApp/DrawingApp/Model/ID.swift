//
//  DRID.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct ID {
  private let id: String
  
  init(id: String) {
    self.id = id
  }
}

extension ID: Hashable {
  static func == (lhs: ID, rhs: ID) -> Bool {
    lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension ID: CustomStringConvertible {
  var description: String {
    id
  }
}
