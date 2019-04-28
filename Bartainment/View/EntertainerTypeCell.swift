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
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                label.textColor = UIColor.yellow
                label.font = UIFont.boldSystemFont(ofSize: 16)
                backgroundColor = .black
                layer.borderColor = UIColor.yellow.cgColor
                layer.borderWidth = 3
            } else {
                label.textColor = .black
                label.font = UIFont.systemFont(ofSize: 16)
                backgroundColor = .white
                layer.borderColor = UIColor.black.cgColor
                layer.borderWidth = 1
            }
        }
    }
    
    fileprivate func setupView() {
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        
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
