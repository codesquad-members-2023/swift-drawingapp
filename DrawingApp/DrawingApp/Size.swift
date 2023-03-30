//
//  Size.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

class Size {
    private let width : Double
    private let height : Double
    
    init() {
        self.width = 150
        self.height = 120
    }
}

extension Size : CustomStringConvertible {
    var description: String {
        return "width : \(self.width), height : \(self.height)"
    }
}
