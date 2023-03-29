//
//  ViewController.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
  
  private var rectangles = [Rectangle]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let viewXRange = (0.0 ... Double(view.frame.width))
    let viewYRange = (0.0 ... Double(view.frame.height))
    
    let pointFactory = RandomPointFactory(xRange: viewXRange, yRange: viewYRange)
    
    let rectFactory = RandomRectangleFactory(pointFactory: pointFactory)
    makeRect(with: rectFactory, count: 4)
  }
  
  private func makeRect(with factory: any RectangleFactory, count: Int) {
    let logger = Logger()
    for i in 0..<count {
      guard let newRect = factory.produce() else { continue }
      rectangles.append(newRect)
      logger.log("Rect\(i + 1) \(newRect.description)")
    }
  }
}
