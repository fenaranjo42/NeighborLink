//
//  PostsTableView.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/28/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

class PostsTableView: UITableView {

    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }
}
