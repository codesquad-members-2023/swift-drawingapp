//
//  Square.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/31.
//

import Foundation

protocol Square {
    var id : ID { get }
    var size : Size { get }
    var position : Position { get }
    var backgroundColor : Color { get set }
    var alpha : Alpha { get set }
    var description : String { get }
    
    func manufacturing() -> MaterialOfSquareView
}
