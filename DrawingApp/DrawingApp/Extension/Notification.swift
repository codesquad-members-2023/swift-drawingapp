//
//  Notification.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/13.
//

import Foundation

extension Notification.Name {
  static let newRectangleHasBeenAdded = Notification.Name("newRectangleHasBeenAdded")
  static let selectRectangle = Notification.Name("selectRectangle")
  static let deselectRectangle = Notification.Name("deselectRectangle")
}

extension Notification {
  struct UserInfoKey {
    typealias Key = String
    
    static let newRect: Key = "newRect"
  }
}
