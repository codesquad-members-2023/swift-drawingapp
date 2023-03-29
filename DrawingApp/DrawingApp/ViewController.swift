//
//  ViewController.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
  
  private var views = [DRView]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let viewXRange = (0.0 ... Double(view.frame.width))
    let viewYRange = (0.0 ... Double(view.frame.height))
    
    let randomFactory = RandomViewFactory(xRange: viewXRange, yRange: viewYRange)
    makeViews(with: randomFactory, count: 4)
  }
  
  private func makeViews(with factory: ViewFactory, count: Int) {
    let logger = Logger()
    for i in 0..<count {
      guard let newView = factory.makeView() else { continue }
      views.append(newView)
      logger.log("Rect\(i + 1) \(newView.description)")
    }
  }
}
