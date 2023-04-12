//
//  BackGroundColor.swift
//  DrawingApp
//
//  Created by 김하림 on 2023/04/11.
//

import Foundation

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
