//
//  ViewController.swift
//  DrawingApp
//
//  Created by ilim on 2023/03/27.
//

import UIKit

class ViewController: UIViewController {
    private var uiViewIndex = 0
    private var plane = Plane()
    private var rectangleFactory = RectangleFactory()
    private var selectedView: UIView?
    private var rectangleViews = [UIView]()
    
    @IBOutlet weak var planeArea: UIView!
    @IBOutlet weak var backgroundColorHexCode: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var controlPanel: UIStackView!
    @IBOutlet weak var alphaText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControlPanel(hidden: true)
        setBackgroundColorTapGesture()
        setStepper()
    }
    
    func setStepper() {
        alphaStepper.maximumValue = 10
        alphaStepper.minimumValue = 1
        alphaStepper.stepValue = 1
    }

    func setControlPanel(hidden: Bool) {
        if hidden { controlPanel.isHidden = true }
        else { controlPanel.isHidden = false }
    }
    
    @IBAction func alphaValueChanged(_ sender: UIStepper) {
        changeRgba(index: uiViewIndex, alpha: sender.value)
    }
    
    func setBackgroundColorTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedBackgroundColor))
        backgroundColorHexCode.isUserInteractionEnabled = true
        backgroundColorHexCode.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func tappedBackgroundColor(sender: UITapGestureRecognizer) {
        changeRgba(index: uiViewIndex)
    }
    
    func changeRgba(index: Int, alpha: Double = -1) {
        var rgba: UIColor
        
        if alpha == -1 {
            rgba = plane.changeBackgroundColor(index: uiViewIndex)
        } else {
            rgba = plane.changeAlpha(index: uiViewIndex, alpha: alpha)
        }
        
        rectangleViews[uiViewIndex].backgroundColor = rgba
        selectedView = rectangleViews[uiViewIndex]
        setBackgroundText(index: uiViewIndex)
    }
    
    @IBAction func planeAreaDidTouched(_ sender: UITapGestureRecognizer) {
        selectedView?.layer.borderWidth = 0
        
        let location = sender.location(in: planeArea)
        let x = location.x
        let y = location.y
        uiViewIndex = plane.getUiViewIndex(x: x, y: y)
        
        if uiViewIndex == -1 {
            setControlPanel(hidden: true)
            selectedView = nil
            return
        } else {
            let rectangleView = rectangleViews[uiViewIndex]
            setControlPanel(hidden: false)
            selectedView = rectangleView
            selectedView?.layer.borderWidth = 4
            selectedView?.layer.borderColor = UIColor.black.cgColor
            setBackgroundText(index: uiViewIndex)
        }
    }
    
    func setBackgroundText(index: Int) {
        guard let selectedRectangle = plane[index] else { return }
        backgroundColorHexCode.text = "#\(selectedRectangle.color.hexColor)"
        alphaText.text = "투명도 : \(selectedRectangle.alpha)"
        alphaStepper.value = selectedRectangle.alpha.alpha
    }

    @IBAction func makeRectangle(_ sender: Any) {
        let newRectangle = rectangleFactory.makeRectangle(viewWidth: planeArea.frame.width, viewHeight: planeArea.frame.height)
        let rectView = plane.makeUiView(rect: newRectangle)
        plane.addRectangle(rectangle: newRectangle)
        rectangleViews.append(rectView)
        planeArea.addSubview(rectView)
    }
}
