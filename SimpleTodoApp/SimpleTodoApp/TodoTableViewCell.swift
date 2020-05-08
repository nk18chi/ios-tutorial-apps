//
//  TodoTableViewCell.swift
//  SimpleTodoApp
//
//  Created by Naoki Mita on 2020-05-06.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit


class CustomUILabel: UILabel {
    required init(fontSize: Int) {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TodoTableViewCell: UITableViewCell {
    
    
    let nameLabel: UILabel = CustomUILabel(fontSize: 25)
    let dateLabel: UILabel = CustomUILabel(fontSize: 12)
    let priorityLabel: UILabel = CustomUILabel(fontSize: 12)

    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        return sv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
          stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
          stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
          stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
          stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        stackView.addArrangedSubview(nameLabel)
        NSLayoutConstraint.activate([
          nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
          nameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
        ])

        stackView.addArrangedSubview(priorityLabel)
        NSLayoutConstraint.activate([
          priorityLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
          priorityLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
        ])
        
        stackView.addArrangedSubview(dateLabel)
        NSLayoutConstraint.activate([
          dateLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
          dateLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
