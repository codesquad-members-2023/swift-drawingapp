//
//  ViewController.swift
//  DrawingApp
//
//  Created by 김하림 on 2023/03/28.
//

import UIKit
import OSLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let rect1 = RandomRectangleFactory().makeRectangle()
        os_log("\(rect1.description)")
    }
}

class RectanglePosition {
    private var X:Double
    private var Y:Double
    
    init() {
        self.X = Double.random(in: 0...UIScreen.main.bounds.width)
        self.Y = Double.random(in: 0...UIScreen.main.bounds.height)
    }
    func getPositionX() -> Double {
        return self.X
    }
    func getPositionY() -> Double {
        return self.Y
    }
}





