//
//  Todo.swift
//  SimpleTodoApp
//
//  Created by Naoki Mita on 2020-05-06.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

enum Priority: Int {
    case high = 0, middle = 1, low = 2
}

struct TodoType {
    static let PriorityName: [String] = ["High Priority", "Medium Priority", "Low Priority"]

    var title: String
    var priority: Priority
    var deadline: Date
    var isCompleted: Bool = false
    
    static func getInitializeData() -> [TodoType] {
        return [
            TodoType(title: "Wake up at 8am", priority: .high, deadline: Date().addingTimeInterval(TimeInterval(86400*Int(arc4random_uniform(30))))),
            TodoType(title: "Eat breakfast", priority: .low, deadline: Date().addingTimeInterval(TimeInterval(86400*Int(arc4random_uniform(30))))),
            TodoType(title: "Do some exercise", priority: .middle, deadline: Date().addingTimeInterval(TimeInterval(86400*Int(arc4random_uniform(30))))),
            TodoType(title: "Finish assignments by the due", priority: .high, deadline: Date().addingTimeInterval(TimeInterval(86400*Int(arc4random_uniform(30))))),
            TodoType(title: "Go to bed at 11pm", priority: .low, deadline: Date().addingTimeInterval(TimeInterval(86400*Int(arc4random_uniform(30))))),
        ]
    }
    
    static func getPriorityString(num: Int) -> String {
        return PriorityName[num]
    }
    
    static func getAllPriorityString() -> [String] {
        return PriorityName
    }    
}
