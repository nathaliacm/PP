//
//  TaskRowView.swift
//  ToDoListApp
//
//  Created by Nathalia Cardoso.
//

import SwiftUI

struct TaskRow: View {
    var task: TaskProtocol
    var toggleCompletion: () -> Void

    var body: some View {
        HStack {
            Text(task.title)
                .strikethrough(task.isCompleted, color: .gray)
                .foregroundColor(task.isCompleted ? .gray : .black)

            Spacer()

            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .blue)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(task.type == .highPriority ? Color.red.opacity(0.2) : Color.white)
        .cornerRadius(8)
    }
}
