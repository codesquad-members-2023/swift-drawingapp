//
//  ColorConverter.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/10.
//

import UIKit

struct ColorConverter {
  func convert(_ color: Color) -> UIColor {
    return UIColor(
      red: CGFloat(color.red),
      green: CGFloat(color.green),
      blue: CGFloat(color.blue),
      alpha: CGFloat(color.alpha.floatValue))
  }
}
