//
//  Extension.swift
//  DrawingApp
//
//  Created by SONG on 2023/04/06.
//

import Foundation
import UIKit

extension UIColor {
    func convert() -> Color {
        return Color(red: Int(self.ciColor.red), green: Int(self.ciColor.green), blue: Int(self.ciColor.blue))
    }
}
