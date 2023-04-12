//
//  Alpha.swift
//  DrawingApp
//
//  Created by 김하림 on 2023/04/11.
//

import Foundation

class Alpha {
    private var alpha:Int
    
    init() {
        self.alpha = Int.random(in: 1...10)
    }
    func getAlpha() -> Int {
        return self.alpha
    }
}
