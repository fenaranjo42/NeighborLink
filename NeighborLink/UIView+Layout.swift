//
//  UIView+Layout.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/28/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

extension UIView {
    
    func setupLayouts(contentView: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let viewDictionary = ["contentView": contentView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[contentView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[contentView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary))
        
    }
}
