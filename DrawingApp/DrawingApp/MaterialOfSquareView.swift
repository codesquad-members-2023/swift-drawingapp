//
//  MaterialOfSquareView.swift
//  DrawingApp
//
//  Created by SONG on 2023/04/03.
//

import Foundation

struct MaterialOfSquareView {
    let rect : CGRect
    let viewColor : [CGFloat]
    let alpha : CGFloat
    
    init(rect: CGRect, viewColor: [CGFloat], alpha: CGFloat) {
        self.rect = rect
        self.viewColor = viewColor
        self.alpha = alpha
    }
}
