//
//  ManufactureListDataSource.swift
//  CarSample
//
//  Created by Admin on 1/18/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Settings Data Source
final class ManufactureListDataSource: NSObject, UITableViewDataSource
{
    private unowned var tableView: UITableView
    
    var cells: [UITableViewCell] = []

    var dataSource: [Manufacture] = [] {
        didSet
        {
            createCells()
            tableView.reloadData()
        }
    }
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
        tableView.registerReusableCell(ManufactureTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cells[indexPath.row]
        return cell
    }
    
    func createCells() {
        
        for (index, manufacture) in dataSource.enumerated() {
            let cell: ManufactureTableViewCell = tableView.dequeueReusableCell(indexPath: IndexPath(row: index,section: 0))
            cell.cellController = manufacture
            cells.append(cell)
        }
        
    }
        
}
