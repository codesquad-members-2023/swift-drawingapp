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
    @IBOutlet weak var controlPanel: UIStackView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                self.view.addGestureRecognizer(tapGestureRecognizer)
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
        UpdateViewStatus()
        self.view.bringSubviewToFront(sender)
        self.view.bringSubviewToFront(controlPanel)
    }
    
    func UpdateViewStatus() {
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
            
            //print(type(of: selectedView))
            selectedView.layer.borderWidth = 2.0
            selectedView.layer.borderColor = UIColor.red.cgColor
            // 1. 일단 컨트롤패널과 사각형을 연결 해
            // 2. 옵저버 -> 신호감지 -> 선택 x -> 새로선택된
        }
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
