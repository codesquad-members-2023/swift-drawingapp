//
//  Alpha.swift
//  DrawingApp
//
//  Created by Noah on 2023/03/29.
//

import Foundation

struct Alpha {
    var level: Int
}

extension Alpha: CustomStringConvertible {
    var description: String {
        return "Alpha: \(self.level)"
    }
}
