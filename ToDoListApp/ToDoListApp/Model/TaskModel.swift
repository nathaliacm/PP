//
//  TaskModel.swift
//  ToDoListApp
//
//  Created by Nathalia Cardoso.
//

import Foundation

enum TaskType {
    case normal
    case highPriority
}

protocol TaskProtocol {
    var id: UUID { get }
    var title: String { get set }
    var isCompleted: Bool { get set }
    var type: TaskType { get }
}

class Task: TaskProtocol {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var type: TaskType
    
    init(title: String, type: TaskType) {
        self.title = title
        self.isCompleted = false
        self.type = type
    }
}

class HighPriorityTask: TaskProtocol {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var type: TaskType = .highPriority
    
    init(title: String) {
        self.title = title
        self.isCompleted = false
    }
}
