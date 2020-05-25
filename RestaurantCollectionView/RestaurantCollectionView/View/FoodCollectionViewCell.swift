//
//  FoodCollectionViewCell.swift
//  RestaurantCollectionView
//
//  Created by Naoki Mita on 2020-05-23.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class CustomUILabel: UILabel {
    required init() {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.boldSystemFont(ofSize: CGFloat(12))
        self.backgroundColor = .white
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FoodCollectionViewCell: UICollectionViewCell {

    private let padding: CGFloat = 8
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.addArrangedSubview(imageView)
//        imageView.matchParent()
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: sv.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: sv.heightAnchor, multiplier: 0.7),
        ])
        sv.addArrangedSubview(nameView)
        sv.addArrangedSubview(priceView)
        sv.addArrangedSubview(categoryView)
        return sv
    }()

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameView: UILabel = CustomUILabel()
    let priceView: UILabel = CustomUILabel()
    let categoryView: UILabel = CustomUILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(stackView)
        stackView.matchParent()
    }
    
    required init?(coder: NSCoder) {
      fatalError()
    }

}
