//
//  Square.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation
import UIKit

class RandomSquare : Square{
    
    var id : ID
    var size : Size
    var position : Position
    var backgroundColor : Color
    var alpha : Alpha
    
    init(id: ID, size: Size, position: Position, backgroundColor: Color, alpha: Alpha) {
        self.id = id
        self.size = size
        self.position = position
        self.backgroundColor = backgroundColor
        self.alpha = alpha
    }
    
    func convertToUIView() -> UIView {
        let point = self.position.convertToCGPoint()
        let size = self.size.convertToCGSize()
        let viewColor = self.backgroundColor.convertToUIColor()
        let alpha = self.alpha.convertToCGFloat()
        
        let rect = CGRect(origin: point, size: size)
        let squareView = UIImageView(frame: rect)
        
        squareView.backgroundColor = viewColor
        squareView.alpha = alpha
        
        return squareView
    }
}

extension RandomSquare : CustomStringConvertible {
    var description: String {
        return "\(self.id.description) , \(self.size.description) , \(self.position.description) , \(self.backgroundColor.description) , \(self.alpha.description)"
    }
}
