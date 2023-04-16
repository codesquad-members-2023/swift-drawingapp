//
//  RgbToUIColor.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/12.
//

import UIKit

struct RgbToUIColor {
    func convertCodeToColor(_ color: Rgb, _ alpha: Alpha) -> UIColor {
        return UIColor(
            displayP3Red: CGFloat(color.red/255),
            green: CGFloat(color.green/255),
            blue: CGFloat(color.blue/255),
            alpha: CGFloat(alpha.alpha/10)
        )
    }
}
