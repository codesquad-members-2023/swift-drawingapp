//
//  RandomAlpha.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/03.
//

import Foundation

class Alpha {
    let alpha = Int.random(in: 1...10)
    
    func getAlpha() -> Int {
        return alpha
    }
}

extension Alpha: CustomStringConvertible {
    var description: String {
        return "Alpha: \(alpha)"
    }
}
