//
//  Randomizable.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

protocol Randomizable {
  associatedtype Figure: Comparable
  
  static func makeRandomFigure(range: ClosedRange<Figure>?) -> Figure
}
