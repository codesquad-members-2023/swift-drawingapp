//
//  Notification.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/13.
//

import Foundation

extension Notification.Name {
  static let newRectangleHasBeenAdded = Notification.Name("newRectangleHasBeenAdded")
}

extension Notification {
  struct UserInfoKey {
    typealias Key = String
    
    static let newRect: Key = "newRect"
  }
}
