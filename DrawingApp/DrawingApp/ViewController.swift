//
//  ViewController.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
  private lazy var plane = Plane(size: Size(width: 0, height: 0), rectangles: [])
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let viewWidth = Double(view.frame.size.width)
    let viewHeight = Double(view.frame.size.height)
    
    self.plane = Plane(size: Size(width: viewWidth, height: viewHeight), rectangles: [])
    
    let viewXRange = (0.0 ... viewWidth)
    let viewYRange = (0.0 ... viewHeight)
    
    let pointFactory = RandomPointFactory(xRange: viewXRange, yRange: viewYRange)
    let rectFactory = RandomRectangleFactory(pointFactory: pointFactory)
    let newRects = makeRect(with: rectFactory, count: 4)
    
    newRects.forEach { rect in plane.add(rect: rect) }
  }
  
  private func makeRect(with factory: any RectangleFactory, count: Int) -> [Rectangle] {
    var newRects = [Rectangle]()
    let logger = Logger()
    for i in 0..<count {
      guard let newRect = factory.produce() else { continue }
      newRects.append(newRect)
      logger.log("Rect\(i + 1) \(newRect.description)")
    }
    return newRects
  }
}
