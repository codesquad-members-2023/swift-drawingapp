//
//  SquareFactory.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

protocol SquareFactory {
    
    func makeSquare(widthLimit : Double, heightLimit : Double) -> Square?
}
