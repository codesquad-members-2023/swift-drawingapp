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
     
        let rect1 = RectangleFactory.createRectangle()
        os_log("\(rect1.description)")
    }
}

protocol RectangleComponent {
    var id:String { get }
    var size:RectangleSize { get }
    var position:RectanglePosition { get }
    var backGroundColor:(red:Int, green:Int, blue:Int) { get }
    var alpha:Int { get }
}

class RectangleSize {
    private var width:Double = 150
    private var height:Double = 120
    
    func getWidth() -> Double {
        return self.width
    }
    func getHeight() -> Double {
        return self.height
    }
}
class RectanglePosition {
    private var X:Double
    private var Y:Double
    
    init(X: Double, Y: Double) {
        self.X = X
        self.Y = Y
    }
    func randomPosition() -> RectanglePosition {
        let x = Double.random(in: 0...UIScreen.main.bounds.width)
        let y = Double.random(in: 0...UIScreen.main.bounds.height)
        return RectanglePosition(X: x, Y: y)
    }
    func getPositionX() -> Double {
        return self.X
    }
    func getPositionY() -> Double {
        return self.Y
    }
}
class Id {
    private var id:String
    
    init(id: String) {
        self.id = id
    }
    func getId() -> String {
        return self.id
    }
}
class Alpha {
    private var alpha:Int
    
    init() {
        self.alpha = Int.random(in: 1...10)
    }
    func getAlpha() -> Int {
        return self.alpha
    }
}
class BackGroundColor {
    private var red:Int
    private var green:Int
    private var blue:Int
    
    init() {
        self.red = Int.random(in: 0...255)
        self.green = Int.random(in: 0...255)
        self.blue = Int.random(in: 0...255)
    }
    func getRed() -> Int {
        return self.red
    }
        
    func getGreen() -> Int {
        return self.green
    }
        
    func getBlue() -> Int {
        return self.blue
    }
}

class IdRandomizer {
    func randomString() -> Id {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 0..<9 {
                let randomIndex = Int.random(in: 0..<letters.count)
                let letter = letters[letters.index(letters.startIndex, offsetBy: randomIndex)]
                randomString.append(letter)
        }
        return "\(randomString.prefix(3))-\(randomString.prefix(6).suffix(3))-\(randomString.suffix(3))"
        }
}

class RectangleFactory {
    static func createRectangle() -> Rectangle {
        let id = IdRandomizer().randomString()
        let size = RectangleSize()
        let position = RectanglePosition(X: 0, Y: 0).randomPosition()
        let backGroundColor = (red: Int.random(in: 0...255), green: Int.random(in: 0...255), blue: Int.random(in: 0...255))
        let alpha = Int.random(in: 1...10)

        return Rectangle(
            id: id,
            size: size,
            position: position,
            backGroundColor: backGroundColor,
            alpha: alpha
        )
    }
}
