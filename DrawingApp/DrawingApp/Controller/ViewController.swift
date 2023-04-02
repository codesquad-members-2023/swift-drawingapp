//
//  ViewController.swift
//  DrawingApp
//
//  Created by ilim on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let numberOfRectangles = 4
        generateRectangles(numberOfRectangle: numberOfRectangles)
    }
    
    func generateRectangles(numberOfRectangle: Int) {
        let rectangle = RectangleFactory()
        
        for i in 1...numberOfRectangle {
            let xRange = 0...Double(self.view.frame.size.width - 150)
            let yRange = 0...Double(self.view.frame.size.height - 120)
            let xCoordinate = Double.random(in: xRange)
            let yCoordinate = Double.random(in: yRange)
            let randomRectangle = rectangle.makeRectangle(x: xCoordinate, y: yCoordinate)
            let systemLog = Logger()
            systemLog.log("Rect\(i) \(randomRectangle)")
        }
    }
}

