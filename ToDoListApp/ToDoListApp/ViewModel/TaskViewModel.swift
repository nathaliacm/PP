//
//  TaskViewModel.swift
//  ToDoListApp
//
//  Created by Nathalia Cardoso.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskProtocol] = []
    
    func addTask(title: String, type: TaskType) {
        let newTask: TaskProtocol
        switch type {
        case .normal:
            newTask = Task(title: title, type: .normal)
        case .highPriority:
            newTask = HighPriorityTask(title: title)
        }
        tasks.append(newTask)
    }
    
    func toggleTaskCompletion(task: TaskProtocol) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
