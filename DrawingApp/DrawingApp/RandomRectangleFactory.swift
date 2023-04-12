//
//  RandomRectangleFactory.swift
//  DrawingApp
//
//  Created by 김하림 on 2023/04/11.
//

import Foundation

//Factory(Concrete Createor)
class RandomRectangleFactory: RectangleFactory {
     func makeRectangle() -> RectangleComponent {
        let id = IdRandomizer().randomString()
        let size = RectangleSize()
        let position = RectanglePosition()
        let backGroundColor = BackGroundColor()
        let alpha = Alpha()

        return Rectangle(
            id: id,
            size: size,
            position: position,
            backGroundColor: backGroundColor,
            alpha: alpha
        )
    }
}
