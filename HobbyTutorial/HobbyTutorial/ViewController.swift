//
//  ViewController.swift
//  HobbyTutorial
//
//  Created by Naoki Mita on 2020-04-16.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        
        let imageName = ["480px-Chess_kdt45.svg", "Chess_rdt45.svg", "Chess_pdt45.svg", "480px-Chess_qdt45.svg", "480px-Chess_ndt45.svg", "480px-Chess_bdt45.svg"]
        var indexForImage = 0
        // childStack
        for _ in 0..<3 {
            let childStackView = UIStackView()
            childStackView.translatesAutoresizingMaskIntoConstraints = false
            childStackView.axis = .horizontal
            childStackView.distribution = .equalSpacing
            
            // add images
            for _ in 0..<2 {
                let square = UIImageView(frame: CGRect.zero)
                square.translatesAutoresizingMaskIntoConstraints = false
                square.image = UIImage(named: imageName[indexForImage])

                let label = UILabel(frame: CGRect.zero)
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = "aaa"
                label.textAlignment = .center
                square.addSubview(label)
                NSLayoutConstraint.activate([
                    label.widthAnchor.constraint(equalTo: square.widthAnchor),
                    label.heightAnchor.constraint(equalTo: square.heightAnchor),
                    label.topAnchor.constraint(equalTo:square.bottomAnchor, constant:  -40)
                ])

                childStackView.addArrangedSubview(square)
                NSLayoutConstraint.activate([
                    square.widthAnchor.constraint(equalToConstant: 100),
                    square.heightAnchor.constraint(equalTo: childStackView.heightAnchor, multiplier: 1),
                ])
                indexForImage += 1
            }
            stackView.addArrangedSubview(childStackView)
            NSLayoutConstraint.activate([
                childStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1),
                childStackView.heightAnchor.constraint(equalToConstant: 120),
            ])
        }
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
        ])
    }


}

