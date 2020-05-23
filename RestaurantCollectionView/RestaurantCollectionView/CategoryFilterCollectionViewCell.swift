//
//  CategoryFilterCollectionViewCell.swift
//  RestaurantCollectionView
//
//  Created by Naoki Mita on 2020-05-22.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class CategoryFilterCollectionViewCell: UICollectionViewCell {

    let labelView: UILabel = {
        let ul = UILabel()
        ul.translatesAutoresizingMaskIntoConstraints = false
        ul.textAlignment = .center
        return ul
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(labelView)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 3
        labelView.matchParent()
    }
    
    required init?(coder: NSCoder) {
      fatalError()
    }
}
