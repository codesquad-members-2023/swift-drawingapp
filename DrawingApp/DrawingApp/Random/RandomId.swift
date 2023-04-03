//
//  RandomId.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/03.
//

import Foundation

class RandomId {
    private static let str = "abcdefghijklmnopqrstuvwxyz0123456789"
    private static let lengthOfId = 9
    private static var id = ""
    
    static func createRandomString() -> String {
        for i in 1...lengthOfId {
            id += String(str.randomElement()!)
            if i != lengthOfId && i % 3 == 0 {
                id += "-"
            }
        }
        
        return id
    }
}

extension RandomId: CustomStringConvertible {
    var description: String {
        return "\(RandomId.id)"
    }
}
