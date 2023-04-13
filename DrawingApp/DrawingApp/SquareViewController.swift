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
        
        NotificationCenter.default.addObserver(self, selector: #selector(synchronizeView) , name: Notification.Name(rawValue:"MODEL CHANGED"), object: nil )
    }

    func createSquare(howMany amount : Int) -> Square?{

        let widthLimit = self.view.bounds.width
        let heightLimit = self.view.bounds.height
        let randomSquareFactory : SquareFactory = RandomSquareFactory()
        guard let newSquare = randomSquareFactory.makeSquare(widthLimit: widthLimit, heightLimit: heightLimit) else {
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
        visualize()
        self.view.bringSubviewToFront(sender)
        self.view.bringSubviewToFront(controlPanel)
    }
    
    @IBAction func sliderValueDidChanged(_ sender: UISlider) {
        guard let modificationOf = selectedView else {
            return
        }
        modificationOf.alpha = CGFloat(sender.value)
        
        guard let matchedIndex = pickCorrespondenceSquare(selectedView: modificationOf) else {
            return
        }
        
        let matchedModel = self.plane[matchedIndex]
        
        modelSynchronizer.synchronizeAlphaOfModel(synchronizeTarget: matchedModel, alpha: modificationOf.alpha)
        
        log.printLog(of: matchedModel, order: 1)
    }
    
    func visualize() {
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
        
        if let old = self.selectedView {
            old.layer.borderWidth = 1.0
            old.layer.borderColor = UIColor.clear.cgColor
        }
        
        if let selectedView = self.view.hitTest(location, with: nil), selectedView != self.view && type(of: selectedView) == UIView.self {
            selectedView.layer.borderWidth = 2.0
            selectedView.layer.borderColor = UIColor.red.cgColor
 
            self.selectedView = selectedView
        }
    }
    
    @objc func colorWellDidChange(_ sender: UIColorWell) {
        guard let selectedView = self.selectedView else {
            return
        }
    
        guard let matchedIndex = pickCorrespondenceSquare(selectedView: selectedView) else {
            return
        }
        
        guard let color = sender.selectedColor?.colorConvert() else {
            return
        }
        
        guard let alpha = sender.selectedColor?.alphaConvert() else {
            return
        }
        
        modelSynchronizer.synchronizeColorOfModel(synchronizeTarget: matchedModel, color: convertedColor)
    }
    
    func pickCorrespondenceSquare(selectedView : UIView) -> Int? {
        var index = 0
        
        for item in squareViews {
            if item == selectedView {
                return index
            }
            index += 1
        }
        return nil
    }
}
