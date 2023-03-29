//
//  ID.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

class ID {
    private var id : String = ""
    
    init() {
        self.id = setId()
    }
    
    func setId() -> String {
        var name = ""
        
        for i in 1...11 {
            
            if i == 4 || i == 8 {
                name += "-"
                continue
            }
            
            let randomOffset = UInt32.random(in: 0...25)
            let randomUnicodeScalar = UnicodeScalar("a").value + randomOffset
            guard let randomLetter = UnicodeScalar(randomUnicodeScalar) else {
                return ""
            }
            name += String(randomLetter)
        }
        self.id = name
        return name
    }
}
