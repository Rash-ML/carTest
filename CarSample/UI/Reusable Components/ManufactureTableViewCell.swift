//
//  ManufactureTableViewCell.swift
//  CarSample
//
//  Created by Admin on 1/18/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation
import UIKit

class ManufactureTableViewCell: UITableViewCell, Reusable, CellConfigurable {
    
    var lblTitleLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.style(style: Styles.Labels.ManufactureTitle)
        return label
        
    }()
    
    let cardView: UIView = {
        
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 5.0
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        addSubview(cardView)
        cardView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10.0)
            make.trailing.equalToSuperview().offset(-10.0)
            make.bottom.equalToSuperview().offset(-5.0)
            make.top.equalToSuperview().offset(5.0)
        }
        
        cardView.addSubview(lblTitleLabel)
        lblTitleLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10.0)
            make.leading.equalToSuperview().offset(10.0)
            make.bottom.top.equalToSuperview()
        }

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut,
                       animations: {
            
                        self.cardView.transform = selected ? CGAffineTransform(translationX: 20.0, y: 0.0) : .identity
                        self.cardView.backgroundColor = selected ? UIColor.lightGray.withAlphaComponent(1.0) : UIColor.lightGray.withAlphaComponent(0.2)
                        
        }) { (finished) in
            
        }
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var cellController: Manufacture? {
        didSet {
            guard let manufacture = cellController else { return }
            lblTitleLabel.text = manufacture.name
        }
    }

}
