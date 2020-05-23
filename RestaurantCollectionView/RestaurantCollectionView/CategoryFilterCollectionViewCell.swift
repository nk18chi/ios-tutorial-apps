//
//  CategoryFilterCollectionViewCell.swift
//  RestaurantCollectionView
//
//  Created by Naoki Mita on 2020-05-22.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class CategoryFilterCollectionViewCell: UICollectionViewCell {
    
    private let padding: CGFloat = 8

    let labelView: UILabel = {
        let ul = UILabel()
        ul.translatesAutoresizingMaskIntoConstraints = false
        ul.textAlignment = .center
        ul.textColor = .mainRed
        return ul
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(labelView)
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 3
        labelView.matchParent(padding: .init(top: padding, left: padding * 2, bottom: padding, right: padding * 2))
    }
    
    required init?(coder: NSCoder) {
      fatalError()
    }
}
