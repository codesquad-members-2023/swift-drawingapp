//
//  ViewController.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
  // MARK: Properties
  
  private var rectangleFactory: RectangleFactory?
  
  private var selectedRectangleView: RectangleView?
  
  private lazy var plane = Plane(size: Size(width: 0, height: 0))
  
  private var rectangleViews: [Rectangle: RectangleView] = [:]
  
  private var colorFactory: ColorFactory? {
    rectangleFactory?.colorFactory
  }
  
  // MARK: Outlets
  
  @IBOutlet weak var planeArea: UIView!
  
  @IBOutlet weak var infoSection: UIView!
  
  @IBOutlet weak var colorInfoLabel: UILabel!
  
  @IBOutlet weak var alphaSlider: UISlider!
  
  // MARK: Actions
  
  @IBAction func addRandomRect(_ sender: Any) {
    guard let newRect = rectangleFactory?.make() else { return }
    plane.add(rect: newRect)
  }
  
  @IBAction func somePositionDidTouched(_ sender: UITapGestureRecognizer) {
    selectedRectangleView?.deselect()
    let location = sender.location(in: sender.view)
    let point = Point(x: location.x, y: location.y)
    plane.selectRectangle(on: point)
  }
  
  @IBAction func colorChanged(_ sender: Any) {
    guard let newColor = colorFactory?.make() else { return }
    plane.setSelectedRectangle(withColor: newColor)
  }
  
  @IBAction func alphaChanged(_ sender: UISlider) {
    let newValue = sender.value
    plane.setSelectedRectangle(withAlpha: newValue)
  }
  
  // MARK: Life-cycle methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  // MARK: Methods
  
  private func configure() {
    let viewWidth = Double(planeArea.frame.size.width)
    let viewHeight = Double(planeArea.frame.size.height)
    self.plane = Plane(size: Size(width: viewWidth, height: viewHeight))
    
    let viewXRange = (0.0 ... viewWidth)
    let viewYRange = (0.0 ... viewHeight)
    let pointFactory = RandomPointFactory(xRange: viewXRange, yRange: viewYRange)
    let rectFactory = RandomRectangleFactory(pointFactory: pointFactory)
    self.rectangleFactory = rectFactory
    
    infoSection.subviews.forEach { view in view.isHidden = true }
    
    // add observer
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(addNewRectangleView(notification:)),
      name: .newRectangleHasBeenAdded,
      object: nil)
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(selectRectangle(notification:)),
      name: .selectRectangle,
      object: nil)
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(deselectRectangle(notification:)),
      name: .deselectRectangle,
      object: nil)
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(setSelectedRectangle(notification:)),
      name: .setNewColor,
      object: nil)
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(setSelectedRectangle(notification:)),
      name: .setNewAlpha,
      object: nil)
  }
  
  private func makeRectView(outOf rect: Rectangle) -> RectangleView {
    let rectSize = CGSize(width: rect.size.width, height: rect.size.height)
    let rectOrigin = CGPoint(x: rect.origin.x, y: rect.origin.y)
    let rectView = RectangleView(frame: CGRect(origin: rectOrigin, size: rectSize))
    rectView.setColor(with: UIColor(color: rect.backgroundColor))
    return rectView
  }
  
  private func updateInfoPane(with rect: Rectangle?) {
    guard let rect else { return }
    colorInfoLabel.text = "#\(rect.backgroundColor.hexDescription)"
    alphaSlider.value = rect.backgroundColor.alpha.floatValue
  }
  
  @objc private func addNewRectangleView(notification: Notification) {
    guard let newRect = notification.userInfo?[Notification.UserInfoKey.newRect] as? Rectangle else { return }
    let rectView = makeRectView(outOf: newRect)
    planeArea.addSubview(rectView)
    rectangleViews.updateValue(rectView, forKey: newRect)
  }
  
  @objc private func selectRectangle(notification: Notification) {
    guard let newRect = notification.userInfo?[Notification.UserInfoKey.newRect] as? Rectangle else { return }
    let rectView = rectangleViews[newRect]
    selectedRectangleView = rectView
    selectedRectangleView?.select()
    
    infoSection.subviews.forEach { view in view.isHidden = false }
    updateInfoPane(with: newRect)
  }
  
  @objc private func deselectRectangle(notification: Notification) {
    selectedRectangleView = nil
    infoSection.subviews.forEach { view in view.isHidden = true }
  }
  
  @objc private func setSelectedRectangle(notification: Notification) {
    guard let newRect = notification.userInfo?[Notification.UserInfoKey.newRect] as? Rectangle else { return }
    selectedRectangleView?.setColor(with: UIColor(color: newRect.backgroundColor))
    updateInfoPane(with: newRect)
  }
}
