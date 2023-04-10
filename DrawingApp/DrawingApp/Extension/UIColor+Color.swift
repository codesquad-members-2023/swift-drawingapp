//
//  UIColor+Color.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/03.
//

import UIKit

extension UIColor {
  convenience init(color: Color) {
    let r = CGFloat(color.red)
    let g = CGFloat(color.green)
    let b = CGFloat(color.blue)
    let alpha = CGFloat(color.alpha.floatValue)
    self.init(red: r, green: g, blue: b, alpha: alpha)
  }
}
