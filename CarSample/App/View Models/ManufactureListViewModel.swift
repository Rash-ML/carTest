//
//  ManufactureViewModel.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation

public class ManufactureListViewModel {
    
    var page: Int = 0
    var pageSize: Int = 15
    
    let manufacturesObservable = Observable<[Manufacture]>.init(initialValue: nil)
    
    func getManufactures() {
        
        getManufacteres(page: self.page,
                        pageSize: self.pageSize,
                        { (manufactures) in
                            self.manufacturesObservable.value = manufactures
        }) { (error) in
            print(error?.localizedDescription ?? "")
        }
    }

}
