//
//  ViewController.swift
//  DrawingApp
//
//  Created by PJB on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var log = Log()
        log.printLog()
    }
}

class Log {
    let factory = RandomShapeFactory()
    
    func printLog() {
        for i in 1...4 {
            let rectangleView = factory.creatRectangle()
            let logger = Logger(subsystem: "com.Aiden.DrawingApp", category: "ViewController")
            logger.log("Rect \(i) \(rectangleView.description) ")
        }
    }
}

func randomPosition() -> Point {
    let randomPositionX = Double.random(in: 0...UIScreen.main.bounds.width)
    let randomPositionY = Double.random(in: 0...UIScreen.main.bounds.height)
    
    return Point(positionX: randomPositionX, positionY: randomPositionY)
}
