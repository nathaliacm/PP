//
//  TaskFactory.swift
//  ToDoListApp
//
//  Created by Nathalia Cardoso.
//

import Foundation

class TaskFactory {
    func createTask(title: String, type: TaskType) -> TaskProtocol {
        switch type {
        case .normal:
            return Task(title: title, type: .normal)
        case .highPriority:
            return HighPriorityTask(title: title)
        }
    }
}
