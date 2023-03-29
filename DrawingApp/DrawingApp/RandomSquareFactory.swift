//
//  RandomSquare.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

class RandomSquareFactory : SquareFactory {
    
    func produce(widthLimit : Double, heightLimit : Double ) -> Square? {
        
        let id = ID()
        let position = Position(width: widthLimit , height: heightLimit)
        let color = Color()
        let size = Size()
        guard let alpha : Alpha = .allCases.randomElement() else {
            return nil
        }

        return Square(id: id, size: size, position: position, backgroundColor: color, alpha: alpha)
    }
}
