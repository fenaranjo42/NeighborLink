//
//  PostsTableViewCell.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/28/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var postView: PostView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
