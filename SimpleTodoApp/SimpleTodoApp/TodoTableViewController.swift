//
//  TodoTableViewController.swift
//  SimpleTodoApp
//
//  Created by Naoki Mita on 2020-05-06.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController, AddTableViewControllerDelegate {
    
    var sortBy: Sort = .priority
    
    enum Sort: Int {
        case priority = 0, deadline = 1
    }
    
    struct CellIdentifier {
      static let add = "AddTodoCell"
      static let todo = "TodoCell"
    }
    
    private var todos: [Int: [TodoType]] = [0:[],1:[],2:[]]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "todo"
        navigationItem.leftBarButtonItem = editButtonItem
        
        for d in TodoType.getInitializeData() {
            todos[d.priority.rawValue]!.append(d)
        }
        
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: CellIdentifier.todo)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddNewTodo))
        let switchOrderButton = UIBarButtonItem(title: "sort", style: .plain, target: self, action: #selector(switchOrder))
        navigationItem.rightBarButtonItems = [addButton, switchOrderButton]
    }
    
    func add(newTodo: TodoType) {
        if (sortBy == .priority) {
            todos[newTodo.priority.rawValue]!.append(newTodo)
            tableView.insertRows(at: [IndexPath(row: todos[newTodo.priority.rawValue]!.count - 1, section: newTodo.priority.rawValue)], with: .automatic)
        } else {
            todos[0]!.append(newTodo)
            tableView.insertRows(at: [IndexPath(row: todos[0]!.count - 1, section: 0)], with: .automatic)
        }
    }
    
    @objc func goToAddNewTodo(_ sender: UIBarButtonItem) {
      let addVC = AddTableViewController(style: .grouped)
      addVC.delegate = self
      navigationController?.pushViewController(addVC, animated: true)
    }
    
    @objc func switchOrder(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Choose sort operation", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // order by priority
        let sortByPriorityAction = UIAlertAction(title: "Sort By Priority", style: .default) { (action) in
            guard self.sortBy != .priority else { return }
            for i in (0..<self.todos[0]!.count).reversed() {
                guard self.todos[0]![i].priority.rawValue > 0 else { continue }
                let t: TodoType = self.todos[0]!.remove(at: i)
                self.todos[t.priority.rawValue]!.append(t)
            }
            self.sortBy = .priority
            self.tableView.reloadData()
        }
        
        // order by deadline
        let sortByDeadlineAction = UIAlertAction(title: "Sort By Deadline", style: .default) { (action) in
            guard self.sortBy != .deadline else { return }
            for i in (1..<self.todos.count) {
                for t in self.todos[i]! {
                    self.todos[0]!.append(t)
                }
                self.todos[i]! = []
            }
            self.sortBy = .deadline
            self.todos[0] = self.todos[0]!.sorted { return $0.deadline < $1.deadline }
            self.tableView.reloadData()
        }
        
        alertController.addAction(sortByPriorityAction)
        alertController.addAction(sortByDeadlineAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // delete operation for rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        todos[indexPath.section]?.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    // operation for table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (sortBy == .priority) ? todos.count : 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (sortBy == .priority) ? TodoType.getPriorityString(num: section): nil
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos[section]!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.todo, for: indexPath) as! TodoTableViewCell

        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: todos[indexPath.section]![indexPath.row].title)
        todos[indexPath.section]![indexPath.row].isCompleted ?
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length)) :
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 0, range: NSMakeRange(0, attributeString.length))
        cell.nameLabel.attributedText = attributeString

        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        cell.dateLabel.text = formatter1.string(from: todos[indexPath.section]![indexPath.row].deadline)
        cell.priorityLabel.text = TodoType.PriorityName[todos[indexPath.section]![indexPath.row].priority.rawValue]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todos[indexPath.section]![indexPath.row].isCompleted = !todos[indexPath.section]![indexPath.row].isCompleted
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //swap order
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var t: TodoType = todos[sourceIndexPath.section]!.remove(at: sourceIndexPath.row)
        t.priority = Priority(rawValue: destinationIndexPath.section)!
        todos[destinationIndexPath.section]!.insert(t, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 70
    }
}
