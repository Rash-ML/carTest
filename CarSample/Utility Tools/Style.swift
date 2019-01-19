//
//  Style.swift
//  CarSample
//
//  Created by Admin on 1/18/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation
import UIKit

//MARK: - View
enum Styles {
    
enum Labels
{
    case ManufactureTitle
    
    func style(label: UILabel) {
        switch self {
        case .ManufactureTitle:
            
            label.textAlignment = .left
            label.backgroundColor = .clear
            label.textColor = UIColor.smockyBlack
            label.font = UIFont.boldSystemFont(ofSize: 30.0)
            
            break
        }
    }
}
    
}

extension UILabel {
    func style(style: Styles.Labels) {
        style.style(label: self)
    }
}
