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
    
    let randomFactory = RandomRectangleFactory(xRange: viewXRange, yRange: viewYRange)
    makeRect(with: randomFactory, count: 4)
  }
  
  private func makeRect(with factory: RectangleFactory, count: Int) {
    let logger = Logger()
    for i in 0..<count {
      guard let newView = factory.makeRectangle() else { continue }
      rectangles.append(newView)
      logger.log("Rect\(i + 1) \(newView.description)")
    }
  }
}
