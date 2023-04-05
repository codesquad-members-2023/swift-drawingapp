//
//  ViewController.swift
//  DrawingApp
//
//  Created by apple on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for idx in 0...3 {
            let rectangle = Rectangle(id: randomId(), w: 150, h: 120, x: randomXPosition(), y: randomYPosition(), r: randomColor(), g: randomColor(), b: randomColor(), alpha: randomAlpha())
            os_log("Rectangle\(idx) \(rectangle)")
        }
    }
    
    func randomId() -> String {
        let character: String = "abcdefghijklmnopqrstuvwxyz"
        let firstPart: String = String((0..<3).map{ _ in character.randomElement()! })
        let secondPart: String = String((0..<3).map{ _ in character.randomElement()! })
        let thirdPart: String = String((0..<3).map{ _ in character.randomElement()! })
        
        return "\(firstPart)-\(secondPart)-\(thirdPart)"
    }
        
    func randomXPosition() -> Double {
        return Double.random(in: 0...UIScreen.main.bounds.width)
    }
    
    func randomYPosition() -> Double {
        return Double.random(in: 0...UIScreen.main.bounds.height)
    }
    
    func randomColor() -> Int {
        return Int.random(in: 0...255)
    }
    
    func randomAlpha() -> Int {
        return Int.random(in: 0...10)
    }
    
}
