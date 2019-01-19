//
//  ManufactureListViewController.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import UIKit
import SnapKit

protocol ManufactureListViewControllerDelegate {
    func didSelectManufacture(_ manufacture: Manufacture)
}

//MARK: - ManufactureListViewController
class ManufactureListViewController: UIViewController {

    var tableview: UITableView = {
        let table = UITableView(frame: .zero)
        table.separatorColor = .clear
        table.backgroundColor = .clear
        table.allowsMultipleSelection = false
        table.contentInset = UIEdgeInsetsMake(20.0, 0.0, 20.0, 0.0)
        return table
    }()
    
    //MARK: -
    var delegate: ManufactureListViewControllerDelegate?
    let viewModel: ManufactureListViewModel

    var tableDataSource: ManufactureListDataSource!
    var tableDelegate: ManufactureListDelegate!
    
    
    //MARK: -
    init(viewModel: ManufactureListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARKL -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .babyPowder
        self.view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        tableDataSource = ManufactureListDataSource(tableView: self.tableview)
        tableDelegate = ManufactureListDelegate(viewController: self)
        self.tableview.dataSource = tableDataSource
        self.tableview.delegate = tableDelegate
        
        viewModel.manufacturesObservable.addObserver(identifier: ManufactureListViewController.reuseIdentifier) { (manufactures) in
            DispatchQueue.main.async {
                self.tableDataSource.dataSource = manufactures
            }
        }
        
        viewModel.getManufactures()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
