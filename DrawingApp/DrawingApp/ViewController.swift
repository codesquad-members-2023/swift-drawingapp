//
//  ViewController.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
  private lazy var plane = Plane(size: Size(width: 0, height: 0))
  
  private var rectangleViews = [RectangleView]()
  
  @IBOutlet weak var planeArea: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let viewWidth = Double(planeArea.frame.size.width)
    let viewHeight = Double(planeArea.frame.size.height)
    
    self.plane = Plane(size: Size(width: viewWidth, height: viewHeight))
    
    let viewXRange = (0.0 ... viewWidth)
    let viewYRange = (0.0 ... viewHeight)
    
    let pointFactory = RandomPointFactory(xRange: viewXRange, yRange: viewYRange)
    let rectFactory = RandomRectangleFactory(pointFactory: pointFactory)
    let newRects = makeRect(with: rectFactory, count: 4)
    
    newRects.forEach { rect in
      plane.add(rect: rect)
      let newRectView = RectangleView(rect: rect)
      rectangleViews.append(newRectView)
    }
    
    presentRects()
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
  
  private func presentRects() {
    for rectView in rectangleViews {
      planeArea.addSubview(rectView)
    }
  }
}
