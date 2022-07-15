//
//  TableView + extension.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import UIKit

extension UITableView {
    
    open func or_registerCellNib(forClass cellClass: AnyClass) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    open func dequeueCell<T: UITableViewCell>(ofType type: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: T.className) as! T
    }
}
