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
        let width: Double = 150
        let height: Double = 120

        generateRectangles(numberOfRectangle: numberOfRectangles, width: width, height: height)
    }
    
    func generateRectangles(numberOfRectangle: Int, width: Double, height: Double) {
        let rectangle = RectangleFactory()
        
        for i in 1...numberOfRectangle {
            let xRange = 0...Double(self.view.frame.size.width - width)
            let yRange = 0...Double(self.view.frame.size.height - height)
            let xCoordinate = Double.random(in: xRange)
            let yCoordinate = Double.random(in: yRange)
            let randomRectangle = rectangle.makeRectangle(x: xCoordinate, y: yCoordinate, width: width, height: height)
            let systemLog = Logger()
            systemLog.log("Rect\(i) \(randomRectangle)")
        }
    }
}

