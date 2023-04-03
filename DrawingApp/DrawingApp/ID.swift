//
//  ID.swift
//  DrawingApp
//
//  Created by PJB on 2023/04/03.
//

import Foundation
class ID: CustomStringConvertible {
    private var id = ""
    private var randomId = UUID().uuidString.suffix(9)
    
    func createID() -> String {
        var id = randomId.map { String($0) }
        id.insert("-", at: 3)
        id.insert("-", at: 7)
        self.id = id.joined()
        return self.id
    }
    
    var description: String {
        return "ID: \(id)"
    }
}
