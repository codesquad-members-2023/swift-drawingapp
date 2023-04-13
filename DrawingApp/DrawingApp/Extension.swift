//
//  Extension.swift
//  DrawingApp
//
//  Created by SONG on 2023/04/06.
//

import Foundation
import UIKit

extension UIColor {
    func colorConvert() -> Color? {
        guard let components = self.cgColor.components else{
            return nil
        }
    
        let red = Int(components[0] * 255)
        let green = Int(components[1] * 255)
        let blue = Int(components[2] * 255)

        return Color(red: red, green: green, blue: blue)
    }
    
    func alphaConvert() -> Alpha? {
        
        guard let components = self.cgColor.components else{
            return nil
        }
        
        let value = Int((components[3] * 10).rounded())
        
        for item in Alpha.allCases {
            if value == item.rawValue {
                return item
            }
        }
        return nil
    }
}
