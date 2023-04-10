//
//  ColorFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol ColorFactory {
  var alphaFactory: AlphaFactory { get set }
  
  func make() -> Color?
}
