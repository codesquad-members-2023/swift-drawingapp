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