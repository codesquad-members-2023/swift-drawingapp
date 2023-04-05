//
//  SquareViewController.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import UIKit

class SquareViewController: UIViewController {
    let log = Logger()
    var plane = Plane()
    var squareViews : [UIView] = []
    var selectedView : UIView? = nil
    @IBOutlet weak var controlPanel: UIStackView!
    @IBOutlet weak var colorWell: UIColorWell!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                self.view.addGestureRecognizer(tapGestureRecognizer)
        
        colorWell.addTarget(self, action: #selector(colorWellDidChange(_:)), for: .valueChanged)
    }

    func createSquare(howMany amount : Int) -> Square?{

        let widthLimit = self.view.bounds.width
        let heightLimit = self.view.bounds.height
        let randomSquareFactory = RandomSquareFactory()
        guard let newSquare = randomSquareFactory.produce(widthLimit: widthLimit, heightLimit: heightLimit) else {
                return nil
            }
        log.printLog(of: newSquare ,order:1)
        return newSquare
    }

    @IBAction func createButtonTouched(_ sender: UIButton) {
        guard let randomSquare = createSquare(howMany: 1) else {
            return
        }
        self.plane.add(randomSquare)
        updateViewStatus()
        self.view.bringSubviewToFront(sender)
        self.view.bringSubviewToFront(controlPanel)
    }
    
    
    @IBAction func sliderValueDidChanged(_ sender: UISlider) {
        guard let newView = selectedView else {
            return
        }
        newView.alpha = CGFloat(sender.value)
    }
    
    func updateViewStatus() {
        guard let createdSquare = self.plane.squareIncluded.last else {
            return
        }
        let squareView = createSquareView(from : createdSquare.manufacturing())
        
        self.view.addSubview(squareView)
    }
    
    func createSquareView(from material : MaterialOfSquareView) -> UIView {
        let red = material.viewColor[0]
        let green = material.viewColor[1]
        let blue = material.viewColor[2]
        let alpha = material.alpha
        
        let newView = UIView()
        
        newView.frame = material.rect
        newView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        self.squareViews.append(newView)
        return newView
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.view)
        
        if let selectedView = self.view.hitTest(location, with: nil), selectedView != self.view && type(of: selectedView) == UIView.self {
            

            selectedView.layer.borderWidth = 2.0
            selectedView.layer.borderColor = UIColor.red.cgColor
 
            self.selectedView = selectedView
        }
    }
    
    @objc func colorWellDidChange(_ sender: UIColorWell) {
        guard let newView = selectedView else {
            return
        }
        newView.backgroundColor = sender.selectedColor
    }
    
    func pickCorrespondenceSquare(selectedView : UIView) -> Square? {
        var index = 0
        
        for item in squareViews {
            let square = self.plane.squareIncluded[index]
            if item == selectedView {
                return square
            }
            index += 1
        }
        return nil
    }
    
    
}
