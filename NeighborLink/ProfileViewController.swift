//
//  ProfileViewController.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 3/2/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let maxHeaderHeight: CGFloat = 120
    let minHeaderHeight: CGFloat = 44
    var previousScrollOffset: CGFloat = 0

    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        headerHeightConstraint.constant = maxHeaderHeight
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private func configureView() {
        profileImage.applyRoundedStyle()
        imageView.clipsToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.applyStyle()
    }
    
}

extension ProfileViewController {
    func setScrollPosition(_ position: CGFloat) {
        self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: position)
    }
    
    func scrollViewStoppedScrolling() {
        let range = self.maxHeaderHeight - self.minHeaderHeight
        let midPoint = self.minHeaderHeight + (range / 2)
        
        if self.headerHeightConstraint.constant > midPoint {
            expandHeader()
        } else {
            collapseHeader()
        }
    }
    
    func collapseHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.headerHeightConstraint.constant = self.minHeaderHeight
            self.view.layoutIfNeeded()
            self.profileImage.transform = CGAffineTransform.init(scaleX: 1.01, y: 1.01)
        }) { _ in
            self.profileImage.transform = CGAffineTransform.identity
        }
    }
    
    func expandHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.headerHeightConstraint.constant = self.maxHeaderHeight
            self.view.layoutIfNeeded()
            self.profileImage.transform = CGAffineTransform.init(scaleX: 1.01, y: 1.01)

        }) { _ in
            self.profileImage.transform = CGAffineTransform.identity
        }
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    // Scrollview Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDifference = scrollView.contentOffset.y - previousScrollOffset
        let absoluteTop: CGFloat = 0;
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height;
        let isScrollingDown = scrollDifference > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp = scrollDifference < 0 && scrollView.contentOffset.y < absoluteBottom
        
        var newHeight = headerHeightConstraint.constant
        if isScrollingDown {
            newHeight = max(self.minHeaderHeight, self.headerHeightConstraint.constant - abs(scrollDifference))
        } else if isScrollingUp {
            newHeight = min(self.maxHeaderHeight, self.headerHeightConstraint.constant + abs(scrollDifference))
        }
        
        if newHeight != headerHeightConstraint.constant {
            headerHeightConstraint.constant = newHeight
        }
        
        previousScrollOffset = scrollView.contentOffset.y
        self.setScrollPosition(previousScrollOffset)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewStoppedScrolling()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scrollViewStoppedScrolling()
        }
    }
}
