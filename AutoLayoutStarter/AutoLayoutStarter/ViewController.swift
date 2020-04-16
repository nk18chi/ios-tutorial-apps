//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        
        // purple box
        let purpleBox: UIView = {
            let view = UIView(frame: CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .purple
            return view
        }()
        main.addSubview(purpleBox)
        NSLayoutConstraint.activate([
          purpleBox.trailingAnchor.constraint(equalTo: main.trailingAnchor, constant: -20),
          purpleBox.bottomAnchor.constraint(equalTo: main.bottomAnchor, constant: -20),
          purpleBox.widthAnchor.constraint(equalTo: main.widthAnchor, multiplier: 0.7),
          purpleBox.heightAnchor.constraint(equalToConstant: 70)
        ])

        // blue vertical boxes
        let blueBox1: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .blue
            NSLayoutConstraint.activate([
              view.heightAnchor.constraint(equalToConstant: 70),
              view.widthAnchor.constraint(equalToConstant: 70)
            ])
            return view
        }()
        let blueBox2: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .blue
            NSLayoutConstraint.activate([
              view.heightAnchor.constraint(equalToConstant: 70),
              view.widthAnchor.constraint(equalToConstant: 70)
            ])
            return view
        }()
        let blueBox3: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .blue
            NSLayoutConstraint.activate([
              view.heightAnchor.constraint(equalToConstant: 70),
              view.widthAnchor.constraint(equalToConstant: 70)
            ])
            return view
        }()
        let boxesStackView = UIStackView(arrangedSubviews: [blueBox1, blueBox2, blueBox3])
        boxesStackView.translatesAutoresizingMaskIntoConstraints = false
        boxesStackView.axis = .vertical
        boxesStackView.alignment = .center
        boxesStackView.spacing = 30
        boxesStackView.distribution = .equalSpacing
        main.addSubview(boxesStackView)
        NSLayoutConstraint.activate([
          boxesStackView.topAnchor.constraint(equalTo: main.topAnchor, constant: 50),
          boxesStackView.bottomAnchor.constraint(equalTo: main.bottomAnchor, constant: -50),
          boxesStackView.centerXAnchor.constraint(equalTo: main.centerXAnchor),
          boxesStackView.centerYAnchor.constraint(equalTo: main.centerYAnchor),
        ])
        
        // red  boxes
        let redBox: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .red
            NSLayoutConstraint.activate([
              view.heightAnchor.constraint(equalToConstant: 50),
              view.widthAnchor.constraint(equalToConstant: 160)
            ])

            // orange boxes
            let orangeBox1: UIView = {
                let view = UIView(frame: CGRect.zero)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.backgroundColor = .orange
                NSLayoutConstraint.activate([
                  view.heightAnchor.constraint(equalToConstant: 40),
                  view.widthAnchor.constraint(equalToConstant: 80)
                ])
                return view
            }()
            let orangeBox2: UIView = {
                let view = UIView(frame: CGRect.zero)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.backgroundColor = .orange
                NSLayoutConstraint.activate([
                  view.heightAnchor.constraint(equalToConstant: 40),
                  view.widthAnchor.constraint(equalToConstant: 50)
                ])
                return view
            }()
            let boxesStackView2 = UIStackView(arrangedSubviews: [orangeBox1, orangeBox2])
            boxesStackView2.translatesAutoresizingMaskIntoConstraints = false
            boxesStackView2.axis = .horizontal
            boxesStackView2.alignment = .center
            boxesStackView2.distribution = .fill
            boxesStackView2.spacing = 5
            view.addSubview(boxesStackView2)
            NSLayoutConstraint.activate([
              boxesStackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              boxesStackView2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
              boxesStackView2.heightAnchor.constraint(equalTo: view.heightAnchor),
              boxesStackView2.widthAnchor.constraint(equalToConstant: 140),
              boxesStackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
              boxesStackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            ])
            return view
        }()
        main.addSubview(redBox)
        NSLayoutConstraint.activate([
          redBox.topAnchor.constraint(equalTo: main.topAnchor, constant: 20),
          redBox.trailingAnchor.constraint(equalTo: main.trailingAnchor, constant: -10),
        ])
        
        return main
    }()
  
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()

    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()

    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()

    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupLayout()
    }

    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true

        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true

        let buttStackView = UIStackView(arrangedSubviews: [squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually

        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
          buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
          buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          buttStackView.heightAnchor.constraint(equalToConstant: 50),
          buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }

    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }

    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}
