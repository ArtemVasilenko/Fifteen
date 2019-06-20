//
//  FifteenCollectionViewCell.swift
//  Fifteen
//
//  Created by Артём Кармазь on 6/20/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import UIKit

class FifteenCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                border.isHidden = false
            } else {
                border.isHidden = true
            }
        }
    }
    
    final private func setup() {
        
        self.addSubview(border)
        
        border.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        border.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        border.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        border.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        border.isHidden = true
        
        self.addSubview(number)
        
        number.centerXAnchor.constraint(equalTo: border.centerXAnchor).isActive = true
        number.centerYAnchor.constraint(equalTo: border.centerYAnchor).isActive = true
    }
    
    
    final let border: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(red: 11/255, green: 104/255, blue: 250/255, alpha: 0.6).cgColor
        view.layer.borderWidth = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    final let number: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
