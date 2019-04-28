//
//  EntertainerTypeCell.swift
//  Bartainment
//
//  Created by Zack Esm on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import UIKit

class EntertainerTypeCell: UICollectionViewCell {
    
    var entertainerType: String! {
        didSet {
            label.text = entertainerType
        }
    }
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    fileprivate func setupView() {
        backgroundColor = .lightGray
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 35)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
