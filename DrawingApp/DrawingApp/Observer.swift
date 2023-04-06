//
//  Observer.swift
//  DrawingApp
//
//  Created by SONG on 2023/04/05.
//

import Foundation

protocol Observer {
    func detectChangeOfAlpha(synchronizeTarget : Square , alpha : CGFloat)
}

class ModelSynchronizer : Observer {
    
    func detectChangeOfAlpha(synchronizeTarget : Square , alpha : CGFloat) {
        let newAlpha = round(alpha * 10)
        var square = synchronizeTarget
        
        for item in Alpha.allCases {
            if Int(newAlpha) == item.rawValue {
                square.alpha = Alpha(rawValue: item.rawValue) ?? .five
                break
            }
        }
    }
}
