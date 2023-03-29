//
//  Color.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

class Color {
    private var red : Int = 0
    private var green : Int = 0
    private var blue : Int = 0
    
    init() {
        self.red = generateRandom()
        self.green = generateRandom()
        self.blue = generateRandom()
    }
    
    func generateRandom() -> Int {
        return Int.random(in: 0...255)
    }
    
}
