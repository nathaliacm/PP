//
//  TaskViewModel.swift
//  ToDoListApp
//
//  Created by Nathalia Cardoso.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskProtocol] = []
    private var taskFactory = TaskFactory()
    
    func addTask(title: String, type: TaskType) {
        let newTask = taskFactory.createTask(title: title, type: type)
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
