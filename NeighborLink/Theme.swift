//
//  Theme.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/9/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

class Theme {
    
    let lightGreen = UIColor(hex: 0x5aca5c)
    let gradientContrastLightGreen = UIColor(hex: 0x6FFF71)
    let charcoal = UIColor(hex: 0x2f2f2f)
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alphaValue: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alphaValue)
    }
    
    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff)
    }
}
