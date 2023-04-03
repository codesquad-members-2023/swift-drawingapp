//
//  Alpha.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

enum Alpha : Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    
    func convert( )-> CGFloat {
        switch self {
        case .one :
            return 0.1
        case .two:
            return 0.2
        case .three:
            return 0.3
        case .four:
            return 0.4
        case .five:
            return 0.5
        case .six:
            return 0.6
        case .seven:
            return 0.7
        case .eight:
            return 0.8
        case .nine:
            return 0.9
        case .ten:
            return 1.0
        }
    }
}

extension Alpha : CustomStringConvertible {
    var description: String {
        return "Alpha level : \(self.rawValue)"
    }
}
