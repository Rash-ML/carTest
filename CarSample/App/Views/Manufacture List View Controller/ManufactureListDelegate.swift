//
//  ManufactureListDelegate.swift
//  CarSample
//
//  Created by Admin on 1/18/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation
import UIKit

class ManufactureListDelegate: NSObject, UITableViewDelegate {
    
    unowned var vc: ManufactureListViewController
    init(viewController: ManufactureListViewController) {
        self.vc = viewController
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let manufacture = vc.tableDataSource.dataSource[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(true, animated: true)
        vc.delegate?.didSelectManufacture(manufacture)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
