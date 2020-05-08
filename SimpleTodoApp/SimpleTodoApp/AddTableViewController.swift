//
//  AddTableViewController.swift
//  SimpleTodoApp
//
//  Created by Naoki Mita on 2020-05-06.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

protocol AddTableViewControllerDelegate: class {
    func add(newTodo: TodoType)
}

class AddTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let nameTC = UITableViewCell()
    let priorityTC = UITableViewCell()
    let dateTC = UITableViewCell()
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    let pickerData = TodoType.getAllPriorityString()
    let priorityField: UIPickerView = {
        let pv = UIPickerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    let dateTextField: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        return dp
    }()
    
    weak var delegate: AddTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewTodo))

        nameTC.addSubview(nameTextField)
        NSLayoutConstraint.activate([
          nameTextField.leadingAnchor.constraint(equalTo: nameTC.leadingAnchor, constant: 16),
          nameTextField.trailingAnchor.constraint(equalTo: nameTC.trailingAnchor, constant: -16),
          nameTextField.topAnchor.constraint(equalTo: nameTC.topAnchor, constant: 5),
          nameTextField.bottomAnchor.constraint(equalTo: nameTC.bottomAnchor, constant: -5)
        ])

        self.priorityField.dataSource = self
        self.priorityField.delegate = self
        priorityTC.addSubview(priorityField)
        NSLayoutConstraint.activate([
          priorityField.leadingAnchor.constraint(equalTo: priorityTC.leadingAnchor),
          priorityField.trailingAnchor.constraint(equalTo: priorityTC.trailingAnchor),
          priorityField.topAnchor.constraint(equalTo: priorityTC.topAnchor),
          priorityField.bottomAnchor.constraint(equalTo: priorityTC.bottomAnchor)
        ])

        dateTC.addSubview(dateTextField)
        NSLayoutConstraint.activate([
          dateTextField.leadingAnchor.constraint(equalTo: dateTC.leadingAnchor),
          dateTextField.trailingAnchor.constraint(equalTo: dateTC.trailingAnchor),
          dateTextField.topAnchor.constraint(equalTo: dateTC.topAnchor),
          dateTextField.bottomAnchor.constraint(equalTo: dateTC.bottomAnchor)
        ])
    }
    
    @objc func saveNewTodo(_ sender: UIBarButtonItem) {
        self.delegate?.add(newTodo: TodoType(title: nameTextField.text!, priority: Priority(rawValue: priorityField.selectedRow(inComponent: 0))!, deadline: dateTextField.date))
      navigationController?.popViewController(animated: true)
    }
    
    // operation for table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0: return nameTC
        case 1: return priorityTC
        case 2: return dateTC
        default: fatalError("Unknown section")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Todo"
        case 1: return "Priority"
        case 2: return "Deadline"
        default: fatalError("Unknown section")
        }
    }
}
