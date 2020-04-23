//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by Naoki Mita on 2020-04-23.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    init() {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 100),
            self.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class DetailsViewController: UIViewController {
    
    var city: City!

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        
        let data: [(String, String)] = [
            ("country", city.icon),
            ("city", city.name),
            ("temperature", String(city.temp)),
            ("precipitation", String(city.precipitation)),
            ("summary", city.summary)
        ]

        for (key, value) in data {
            let headLabel = CustomLabel()
            headLabel.text = key
            stackView.addArrangedSubview(headLabel)
            
            let descriptionLabel = CustomLabel()
            descriptionLabel.text = value
            stackView.addArrangedSubview(descriptionLabel)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
