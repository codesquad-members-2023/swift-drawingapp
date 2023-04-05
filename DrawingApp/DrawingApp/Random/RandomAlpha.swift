//
//  RandomAlpha.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/03.
//

import Foundation

class Alpha {
    private let alpha = Int.random(in: 1...10)
}

extension Alpha: CustomStringConvertible {
    var description: String {
        return "Alpha: \(alpha)"
    }
}
