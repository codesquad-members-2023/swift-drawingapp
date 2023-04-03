//
//  ViewController.swift
//  DrawingApp
//
//  Created by PJB on 2023/03/27.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

func randomPosition() -> Point {
    let randomPositionX = Double.random(in: 0...UIScreen.main.bounds.width)
    let randomPositionY = Double.random(in: 0...UIScreen.main.bounds.height)
    
    return Point(positionX: randomPositionX, positionY: randomPositionY)
}
