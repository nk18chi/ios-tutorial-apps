//
//  ViewController.swift
//  NavbarAnimation
//
//  Created by Naoki Mita on 2020-05-13.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cellId: String = "snackCell"
    private var snack: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snack.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = snack[indexPath.row]
        return cell
    }
    
    
    var isTapped: Bool = false
    
    var addButton: UIButton = {
        let ub = UIButton(type: .system)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.setTitle("＋", for: .normal)
        ub.titleLabel?.font = ub.titleLabel?.font.withSize(30)
        ub.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            ub.heightAnchor.constraint(equalToConstant: 44),
            ub.widthAnchor.constraint(equalToConstant: 44),
        ])
        return ub
    }()
    
    let snackStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.isHidden = true
        
        let images = ["oreos", "pizza_pockets", "pop_tarts", "popsicle", "ramen"]
        for i in images {
            let imgBtn = UIButton(frame: .zero)
            imgBtn.setTitle(i, for: .normal)
            imgBtn.setImage(UIImage(named: i), for: .normal)
            imgBtn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
            sv.addArrangedSubview(imgBtn)
            NSLayoutConstraint.activate([
                imgBtn.heightAnchor.constraint(equalToConstant: 60),
                imgBtn.widthAnchor.constraint(equalToConstant: 60),
            ])
        }
        
        return sv
    }()

    lazy var navBar: UIView = {
        let uv = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 88))
        uv.translatesAutoresizingMaskIntoConstraints = false
        uv.backgroundColor = .lightGray
        uv.autoresizesSubviews = true
        return uv
    }()
    
    let label: UILabel = {
        let ul = UILabel()
        ul.translatesAutoresizingMaskIntoConstraints = false
        ul.text = "snacks"
        return ul
    }()
    
    lazy var tableView: UITableView = {
        let tbc = UITableView(frame: CGRect(x: 0, y: 88, width: view.frame.size.width, height: view.frame.size.height - 88))
        tbc.translatesAutoresizingMaskIntoConstraints = false
        return tbc
    }()
    

    
    @objc func addTapped(sender: UIButton!) {
        if (!isTapped) {
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, animations: {
                self.navBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
                self.tableView.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 200)
                self.addButton.transform = CGAffineTransform(rotationAngle: 45 * .pi / 180)
                self.snackStackView.isHidden = false
            })
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, animations: {
                self.navBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 88)
                self.tableView.frame = CGRect(x: 0, y: 88, width: self.view.frame.size.width, height: self.view.frame.size.height - 88)
                self.addButton.transform = CGAffineTransform(rotationAngle: 0)
                self.snackStackView.isHidden = true
            })
        }
        isTapped = !isTapped
    }
    
    @objc func imageTapped(sender: UIButton!) {
        snack.append(sender.title(for: .normal)!)
        tableView.insertRows(at: [IndexPath(row: snack.count - 1, section: 0)], with: .automatic)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navBar)
        view.addSubview(snackStackView)
        NSLayoutConstraint.activate([
            snackStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            snackStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            snackStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
