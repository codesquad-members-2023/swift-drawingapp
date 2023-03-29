//
//  RandomViewIngridientFactory.swift
//  DrawingApp
//
//  Created by Noah on 2023/03/29.
//

import Foundation

final class RandomViewIngridientFactory: ViewIngridientFactory {
    private let maxPosition: Position
    private let minPosition: Position
    private static var uniqueIdentifiers = Unique<Identifier>()
    
    init(maxPosition: Position, minPosition: Position) {
        self.maxPosition = maxPosition
        self.minPosition = minPosition
    }
    
    func makeID() -> Identifier {
    }
    
    func makeFrame() -> Frame {
    }
    
    func makeColor() -> Color {
    }
    
    func makeAlpha() -> Alpha {
    }
}
