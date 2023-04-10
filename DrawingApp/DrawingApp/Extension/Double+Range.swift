//
//  Double+Range.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/03.
//

import Foundation

extension Double {
  func getRange(withLength length: Self) -> ClosedRange<Self> {
    let upperBound: Double = self + length
    return (self ... upperBound)
  }
  
  func isOn(range: ClosedRange<Double>) -> Bool {
    return range.contains(self)
  }
}
