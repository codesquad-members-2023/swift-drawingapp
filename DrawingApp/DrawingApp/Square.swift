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
    var backgroundColor : Color { get }
    var alpha : Alpha { get }
    
    var description : String { get }
}
