//
//  UITableView+Helper.swift
//  CarSample
//
//  Created by Admin on 1/18/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation
import UIKit

public protocol CellConfigurable: class {
    
    associatedtype Controller
    var cellController: Controller? { get set }
    
}

extension UITableView {
    
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerReusableHeader<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier) as! T
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: Reusable {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier) as! T
    }
    
    func dequeueReusableHeaderView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
    
}
