//
//  Square.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation
import UIKit

class RandomSquare : Square{
    
    private(set) var id : ID
    private(set) var size : Size
    private(set) var position : Position
    var backgroundColor : Color
    var alpha : Alpha
    
    init(id: ID, size: Size, position: Position, backgroundColor: Color, alpha: Alpha) {
        self.id = id
        self.size = size
        self.position = position
        self.backgroundColor = backgroundColor
        self.alpha = alpha
    }
    
    func manufacturing() -> MaterialOfSquareView {
        let point = self.position.convert()
        let size = self.size.convert()
        let viewColor = self.backgroundColor.convert()
        let alpha = self.alpha.convert()
        
        let rect = CGRect(origin: point, size: size)
        
        return MaterialOfSquareView(rect: rect, viewColor: viewColor, alpha: alpha)
    }
}

extension RandomSquare : CustomStringConvertible {
    var description: String {
        return "\(self.id.description) , \(self.size.description) , \(self.position.description) , \(self.backgroundColor.description) , \(self.alpha.description)"
    }
}
