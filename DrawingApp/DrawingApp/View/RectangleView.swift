//
//  RectangleView.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/03.
//

import UIKit

class RectangleView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    layer.borderColor = UIColor.systemBlue.cgColor
    deselect()
  }
  
  func select() {
    self.layer.borderWidth = 4
  }
  
  func deselect() {
    self.layer.borderWidth = 0
  }
  
  func setColor(with color: UIColor) {
    backgroundColor = color
  }
}
