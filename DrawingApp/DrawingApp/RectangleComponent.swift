//
//  RectangleComponent.swift
//  DrawingApp
//
//  Created by 김하림 on 2023/04/11.
//

import Foundation

//Product Protocol
protocol RectangleComponent: CustomStringConvertible {
    var id:Id { get set }
    var size:RectangleSize { get set }
    var position:RectanglePosition { get set }
    var backGroundColor:BackGroundColor { get set }
    var alpha:Alpha { get set }
}
