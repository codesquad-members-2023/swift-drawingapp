//
//  RandomSquare.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

class RandomSquareFactory : SquareFactory {
    
    func produce(widthLimit : Double, heightLimit : Double ) -> RandomSquare? {
        
        let id = ID()
        let position = Position(width: widthLimit , height: heightLimit)
        let color = generateRandomColor()
        let size = Size()
        guard let alpha : Alpha = .allCases.randomElement() else {
            return nil
        }

        return RandomSquare(id: id, size: size, position: position, backgroundColor: color, alpha: alpha)
    }
    
    func generateRandomColor() -> Color {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        return Color(red: red, green: green, blue: blue)
    }

}
