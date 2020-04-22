//
//  ViewController.swift
//  StoriesNavigationController
//
//  Created by Naoki Mita on 2020-04-21.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let nextRoomStackView = UIStackView()
    let nextRooms = [
        "front_door": ["coat_room"],
        "coat_room": ["library", "dining_room", "stairs_up"],
        "library": ["secret_passage"],
        "secret_passage": ["dungeon", "labratory", "mysterious_lake"],
        "dungeon": [],
        "labratory": ["generator"],
        "generator": [],
        "mysterious_lake": ["cursed_chalice"],
        "dining_room": ["kitchen"],
        "kitchen": ["back_porch"],
        "back_porch": [],
        "stairs_up": ["bedroom", "bathroom"],
        "bedroom": [],
        "bathroom": []
    ]
    
    var current = "front_door"

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.current
        
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: current)
        stackView.addArrangedSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: stackView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        

            
        nextRoomStackView.translatesAutoresizingMaskIntoConstraints = false
        nextRoomStackView.axis = .vertical
        nextRoomStackView.distribution = .equalSpacing
        
        let children = nextRooms[current]!
        for i in 0..<children.count {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            nextRoomStackView.addArrangedSubview(button)
            button.tag = i
            button.setTitle(children[i], for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(ViewController.moveNextPage(sender:)), for: .touchUpInside)
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 100),
                button.heightAnchor.constraint(equalToConstant: 50),
            ])
        }
        
        stackView.addArrangedSubview(nextRoomStackView)
        NSLayoutConstraint.activate([
            nextRoomStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            nextRoomStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            nextRoomStackView.heightAnchor.constraint(equalToConstant: 200)
        ])

    }
    
    @objc func moveNextPage(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
        newVC.current = nextRooms[current]![sender.tag]
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}

