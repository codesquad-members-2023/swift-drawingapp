//
//  RectangleFactory.swift
//  DrawingApp
//
//  Created by 김하림 on 2023/04/11.
//

import Foundation

//Creator
//return 하는 객체는 Product Protocol을 준수해야 함
protocol RectangleFactory {
    func makeRectangle() -> RectangleComponent
}
