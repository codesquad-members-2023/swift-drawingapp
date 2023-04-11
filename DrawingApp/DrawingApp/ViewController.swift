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
//Product Protocol
protocol RectangleComponent: CustomStringConvertible {
    var id:Id { get set }
    var size:RectangleSize { get set }
    var position:RectanglePosition { get set }
    var backGroundColor:BackGroundColor { get set }
    var alpha:Alpha { get set }
}

//Creator
//return 하는 객체는 Product Protocol을 준수해야 함
protocol RectangleFactory {
    func makeRectangle() -> RectangleComponent
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
        let id = Id(id: "\(randomString.prefix(3))-\(randomString.prefix(6).suffix(3))-\(randomString.suffix(3))")
        return id
        }
}

//Factory(Concrete Createor)
class RandomRectangleFactory: RectangleFactory {
     func makeRectangle() -> RectangleComponent {
        let id = IdRandomizer().randomString()
        let size = RectangleSize()
        let position = RectanglePosition()
        let backGroundColor = BackGroundColor()
        let alpha = Alpha()

        return Rectangle(
            id: id,
            size: size,
            position: position,
            backGroundColor: backGroundColor,
            alpha: alpha
        )
    }
}
