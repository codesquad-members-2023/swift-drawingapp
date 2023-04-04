//
//  ViewController.swift
//  DrawingApp
//
//  Created by ilim on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
    private let numberOfRectangles = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomRectangles(numberOfRectangles: self.numberOfRectangles)
    }
    
    func generateRandomRectangles(numberOfRectangles: Int) {
        let widthOfView = view.frame.width
        let heightOfView = view.frame.height
        let rectangleFactory = RectangleFactory()
        
        for i in 1...numberOfRectangles {
            let rectangle = rectangleFactory.makeRectangle(viewWidth: widthOfView, viewHeight: heightOfView)
            os_log("Rect\(i) \(rectangle)")
        }
    }
}

