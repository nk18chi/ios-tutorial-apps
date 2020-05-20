//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Naoki Mita on 2020-05-20.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet var timeRemainingLabel: UILabel!
    var minutes: Int!
    var orderMinutes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }
}
