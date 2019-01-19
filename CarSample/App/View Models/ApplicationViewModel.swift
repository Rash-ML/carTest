//
//  ApplicationViewModel.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation
import UIKit

//MARK: - ApplicationViewModelDelegate
protocol ApplicationViewModelDelegate: class {
    
    func applciationLaunchedFromUrl(_ url: URL)
    func applicationDidLaunchNormally()
    //func applicationLaunchedFromPushnotification(_ notification: [String: Any])
}

//MARK: - ApplicationViewModel
public class ApplicationViewModel {
    
    private let launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    weak var delegate: ApplicationViewModelDelegate?
    
    public init(launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        self.launchOptions = launchOptions
    }
    
    //MARK: -
    public func checkOptions() {
        
        
        guard let options = self.launchOptions else {
            self.delegate?.applicationDidLaunchNormally()
            return
        }
        
        //check options...
        print(options)
        
    }
}
