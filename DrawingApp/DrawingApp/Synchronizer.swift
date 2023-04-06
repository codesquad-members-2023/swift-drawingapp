//
//  Observer.swift
//  DrawingApp
//
//  Created by SONG on 2023/04/05.
//

import Foundation

protocol Synchronizer {
    func synchronizeAlphaOfModel(synchronizeTarget : Square , alpha : CGFloat)
    func synchronizeColorOfModel(synchronizeTarget : Square , color : Color)
}

class ModelSynchronizer : Synchronizer {
    
    func synchronizeAlphaOfModel(synchronizeTarget : Square , alpha : CGFloat) {
        let newAlpha = round(alpha * 10)
        var square = synchronizeTarget
        
        for item in Alpha.allCases {
            if Int(newAlpha) == item.rawValue {
                square.alpha = Alpha(rawValue: item.rawValue) ?? .five
                break
            }
        }
    }
    
    func synchronizeColorOfModel(synchronizeTarget : Square , color : Color) {
        var square = synchronizeTarget
        square.backgroundColor = color
    }
}
