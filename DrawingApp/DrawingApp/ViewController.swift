//
//  ViewController.swift
//  DrawingApp
//
//  Created by leehwajin on 2023/03/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rectangle = Rectangle(locatedX: Double.random(in: 0...UIScreen.main.bounds.width), locatedY:  Double.random(in: 0...UIScreen.main.bounds.height))
        print(rectangle)
    }


}

