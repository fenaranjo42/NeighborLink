//
//  PostCell.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/26/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

class PostView: UIView, NibLoadableView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func setNeedsLayout() {
         configureView()
    }

    func commonInit() {
        let nib = UINib(nibName: PostView.nibName, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(contentView)
        setupLayouts(contentView: contentView)
    }
    
    private func configureView() {
        profileImage.applyRoundedStyle()
    }

}
