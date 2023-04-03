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
  
  private var rectangleFactory: RectangleFactory? = nil
  
  @IBOutlet weak var planeArea: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  @IBAction func addRandomRect(_ sender: Any) {
    guard let factory = rectangleFactory else { return }
    makeRect(with: factory)
  }
  
  private func configure() {
    let viewWidth = Double(planeArea.frame.size.width)
    let viewHeight = Double(planeArea.frame.size.height)
    self.plane = Plane(size: Size(width: viewWidth, height: viewHeight))
    
    let viewXRange = (0.0 ... viewWidth)
    let viewYRange = (0.0 ... viewHeight)
    let pointFactory = RandomPointFactory(xRange: viewXRange, yRange: viewYRange)
    let rectFactory = RandomRectangleFactory(pointFactory: pointFactory)
    self.rectangleFactory = rectFactory
  }
  
  private func makeRect(with factory: RectangleFactory) {
    guard let newRect = factory.produce() else { return }
    plane.add(rect: newRect)
    let index = plane.count
    Logger().log("Rect\(index) \(newRect.description)")
    
    let rectView = RectangleView(rect: newRect)
    planeArea.addSubview(rectView)
  }
}
