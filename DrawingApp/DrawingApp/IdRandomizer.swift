//
//  IdRandomizer.swift
//  DrawingApp
//
//  Created by 김하림 on 2023/04/11.
//

import Foundation

class IdRandomizer {
    func randomString() -> Id {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 0..<9 {
                let randomIndex = Int.random(in: 0..<letters.count)
                let letter = letters[letters.index(letters.startIndex, offsetBy: randomIndex)]
                randomString.append(letter)
        }
        let id = Id(id: "\(randomString.prefix(3))-\(randomString.prefix(6).suffix(3))-\(randomString.suffix(3))")
        return id
        }
}
