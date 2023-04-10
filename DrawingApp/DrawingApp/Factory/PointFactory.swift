//
//  PointFactory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol PointFactory {
  func make() -> Point?
  func makeOrigin(consideringSize size: Size) -> Point?
}
