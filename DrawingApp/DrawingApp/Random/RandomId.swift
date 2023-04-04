//
//  RandomId.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/03.
//

import Foundation

class Id {
    private let str = "abcdefghijklmnopqrstuvwxyz0123456789"
    private let lengthOfId = 9
    private var id = ""
    
    init() {
        self.id = createRandomString()
    }
    
    func createRandomString() -> String {
        var generatedId = ""
        
        for i in 1...lengthOfId {
            generatedId += String(str.randomElement()!)
            if i != lengthOfId && i % 3 == 0 {
                generatedId += "-"
            }
        }
        
        return generatedId
    }
}

extension Id: CustomStringConvertible {
    var description: String {
        return "(\(id))"
    }
}
