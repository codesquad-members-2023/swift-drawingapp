//
//  RectangleView.swift
//  DrawingApp
//
//  Created by Effie on 2023/04/03.
//

import UIKit

class RectangleView: UIView {
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init(rect: Rectangle) {
    let viewSize = CGSize(width: rect.size.width, height: rect.size.height)
    let viewOrigin = CGPoint(x: rect.origin.x, y: rect.origin.y)
    self.init(frame: CGRect(origin: viewOrigin, size: viewSize))
    self.backgroundColor = UIColor(color: rect.backgroundColor)
  }
}
