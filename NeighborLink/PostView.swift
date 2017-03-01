//
//  PostCell.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/26/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

class PostView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

       func commonInit() {
        let nib = UINib(nibName: "PostView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(contentView)
        setupLayouts(contentView: contentView)
    }

}
