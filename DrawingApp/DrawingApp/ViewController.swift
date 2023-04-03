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
  
  private var rectangleFactory: RectangleFactory?
  
  private var selectedRectangleView: RectangleView?
  
  private var selectedRectangle: Rectangle?
  
  @IBOutlet weak var planeArea: UIView!
  
  @IBOutlet weak var colorInfoSection: UIStackView!
  
  @IBOutlet weak var alphaSection: UIStackView!
  
  @IBOutlet weak var colorInfoLabel: UILabel!
  
  @IBOutlet weak var alphaSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  @IBAction func addRandomRect(_ sender: Any) {
    guard let factory = rectangleFactory else { return }
    makeRect(with: factory)
  }
  
  @IBAction func somePositionDidTouched(_ sender: UITapGestureRecognizer) {
    selectedRectangleView?.deselect()
    
    let location = sender.location(in: planeArea)
    let latest = planeArea.hitTest(location, with: nil)
    guard let lastesRectView = latest as? RectangleView else {
      selectedRectangleView = nil
      selectedRectangle = nil
      colorInfoSection.isHidden = true
      alphaSection.isHidden = true
      return
    }
    
    selectedRectangleView = lastesRectView
    lastesRectView.select()
    
    let point = Point(x: location.x, y: location.y)
    let rect = plane.getRectangles(on: point).last
    selectedRectangle = rect
    updateInfoPane(with: rect)
  }
  
  @IBAction func alphaChanged(_ sender: UISlider) {
    let newValue = sender.value
    selectedRectangle?.setAlpha(to: newValue)
    selectedRectangleView?.setAlpha(to: newValue)
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
  
  private func updateInfoPane(with rect: Rectangle?) {
    guard let rect else { return }
    colorInfoSection.isHidden = false
    alphaSection.isHidden = false
    colorInfoLabel.text = rect.backgroundColor.hexDescription
    alphaSlider.value = rect.backgroundColor.alpha.floatValue
  }
}
