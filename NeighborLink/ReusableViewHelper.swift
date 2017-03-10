//
//  ReusableViewHelper.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 3/9/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView, NibLoadableView{}

extension UITableView {
    /**
    Convenience funciton to extract away the registration of a reusable nib for a cell
     Use: tableView.register(ExampleCell)
     */
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

extension UITableView {
    /**
     Convenience function to extract away the dequeueing of a cell
     Use: tableView.dequeueReusableCell(forIndexPathL indexPath) as ExampleTableViewCell
     */
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
