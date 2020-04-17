//
//  ViewController.swift
//  LightApp
//
//  Created by Naoki Mita on 2020-04-16.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var onLight = true
    @IBAction func switchBackGround(_ sender: UITapGestureRecognizer) {
        onLight = !onLight
        view.backgroundColor = onLight ? .white : .black
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

