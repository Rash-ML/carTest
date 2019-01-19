//
//  UIStoryBoard+Helper.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation
import UIKit

enum StoryBoardName: String, RawRepresentable {
    case mainStoryBoard = "Main"
}

//MARK: -
extension UIViewController {

    func load<T: UIViewController>(_ viewController: T.Type,from storyboardName: StoryBoardName) -> T {
        
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName.rawValue,bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: T.reuseIdentifier) as? T ?? T()
        return vc
    }
    
}

