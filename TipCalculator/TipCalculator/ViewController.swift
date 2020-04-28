//
//  ViewController.swift
//  TipCalculator
//
//  Created by Naoki Mita on 2020-04-27.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class CustomStackTable: UIStackView {
    var headline = UILabel()
    var label = UILabel()

    required init(t1: String, t2: String) {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .equalSpacing
        
        headline.translatesAutoresizingMaskIntoConstraints = false
        headline.text = t1
        headline.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = t2

        self.addArrangedSubview(headline)
        self.addArrangedSubview(label)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ViewController: UIViewController, UITextFieldDelegate {
    
    var billAmountTextField = UITextField()
    var tips = CustomStackTable(t1: "tips(%): ", t2: "0")
    var total = CustomStackTable(t1: "total($): ", t2: "0")
    var amount: String = "0"
    var adjustTipPercentage = UISlider()

    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        
        return stackView
    }()
    
    let sliderStackView: UIStackView = {
        let sliderStackView = UIStackView()
        sliderStackView.translatesAutoresizingMaskIntoConstraints = false
        sliderStackView.axis = .vertical
        sliderStackView.distribution = .equalSpacing
        
        return sliderStackView
    }()
    
    let textStackView: UIStackView = {
        let textStackView = UIStackView()
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.axis = .horizontal
        textStackView.distribution = .equalSpacing
        
        let left = UILabel()
        left.translatesAutoresizingMaskIntoConstraints = false
        left.text = "0%"
        let right = UILabel()
        right.translatesAutoresizingMaskIntoConstraints = false
        right.text = "100%"
        textStackView.addArrangedSubview(left)
        textStackView.addArrangedSubview(right)

        return textStackView
    }()
    
    let tableStackView: UIStackView = {
        let tableStackView = UIStackView()
        tableStackView.translatesAutoresizingMaskIntoConstraints = false
        tableStackView.axis = .vertical
        tableStackView.distribution = .equalSpacing

        return tableStackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        billAmountTextField.delegate = self
        billAmountTextField.translatesAutoresizingMaskIntoConstraints = false
        billAmountTextField.layer.borderColor = UIColor.placeholderText.cgColor
        billAmountTextField.layer.borderWidth = 1
        billAmountTextField.font = UIFont(name: "Helvetica Neue", size: 30)
        billAmountTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)

        stackView.addArrangedSubview(billAmountTextField)
        NSLayoutConstraint.activate([
            billAmountTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            billAmountTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            billAmountTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        stackView.addArrangedSubview(sliderStackView)
        NSLayoutConstraint.activate([
            sliderStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            sliderStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        adjustTipPercentage.translatesAutoresizingMaskIntoConstraints = false
        sliderStackView.addArrangedSubview(adjustTipPercentage)
        NSLayoutConstraint.activate([
            adjustTipPercentage.leadingAnchor.constraint(equalTo: sliderStackView.leadingAnchor),
            adjustTipPercentage.trailingAnchor.constraint(equalTo: sliderStackView.trailingAnchor),
        ])
        adjustTipPercentage.addTarget(self, action: #selector(tipChanged), for: .valueChanged)
        sliderStackView.addArrangedSubview(textStackView)
        NSLayoutConstraint.activate([
            textStackView.leadingAnchor.constraint(equalTo: sliderStackView.leadingAnchor),
            textStackView.trailingAnchor.constraint(equalTo: sliderStackView.trailingAnchor),
        ])

        
        tableStackView.addArrangedSubview(tips)
        NSLayoutConstraint.activate([
            tips.leadingAnchor.constraint(equalTo: tableStackView.leadingAnchor),
            tips.trailingAnchor.constraint(equalTo: tableStackView.trailingAnchor),
        ])
        
        tableStackView.addArrangedSubview(total)
        NSLayoutConstraint.activate([
            total.leadingAnchor.constraint(equalTo: tableStackView.leadingAnchor),
            total.trailingAnchor.constraint(equalTo: tableStackView.trailingAnchor),
        ])
        stackView.addArrangedSubview(tableStackView)
        NSLayoutConstraint.activate([
            tableStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            tableStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
     @objc func keyboardWillHide(_ recogizer: UITapGestureRecognizer) {
        billAmountTextField.resignFirstResponder()
        view.frame.origin.y = 0
     }
    
     @objc func keyboardWillShow(notification: Notification) {
       if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
         if view.frame.origin.y == 0 {
           view.frame.origin.y -= keyboardSize.height / 2
         }
       }
    }
    
    @objc func textChanged(_ sender: UITextField) {
      if let text = sender.text {
        amount = text
      }
      calculateTotal()
    }
    
    @objc func tipChanged(_ sender: UISlider) {
        tips.label.text = String(Int(floor(sender.value * 100)))
        calculateTotal()
    }
    
    @objc func calculateTotal() {
        if let t = Double(amount) {
            let sum: Double = t + Double(tips.label.text!)! / 100 * t
            total.label.text = String(Int(sum))
        } else {
            total.label.text = "Error! You have to type only integer."
        }
    }

}

