//
//  Theme.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/9/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

struct Theme {
    
    static let lightGreen = UIColor(hex: 0x5aca5c)
    static let gradientContrastLightGreen = UIColor(hex: 0x6FFF71)
    static let charcoal = UIColor(hex: 0x2f2f2f)
    static let lightBlue = UIColor(hex: 0x05B8E6)
    
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

extension UIImageView {
    func applyRoundedStyle() {
        layer.cornerRadius = frame.size.width / 2
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
        clipsToBounds = true
    }

}

extension UINavigationBar {
    func applyStyle() {
        barTintColor = Theme.lightBlue
    }
}

extension UITabBar {
    func applyStyle() {
        tintColor = Theme.lightBlue
    }
}


