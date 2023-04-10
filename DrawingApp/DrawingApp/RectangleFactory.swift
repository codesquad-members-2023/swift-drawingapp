//
//  ViewFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

protocol RectangleFactory {
  var colorFactory: ColorFactory { get set }
  
  func make() -> Rectangle?
}
