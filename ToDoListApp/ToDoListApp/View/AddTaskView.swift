//
//  AddTaskView.swift
//  ToDoListApp
//
//  Created by Nathalia Cardoso.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    @State private var taskTitle = ""
    @State private var isHighPriority: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Detalhes da Tarefa")) {
                    TextField("Título", text: $taskTitle)
                }
                
                Section(header: Text("Prioridade")) {
                    Toggle(isOn: $isHighPriority) {
                        Text("Alta Prioridade")
                            .foregroundColor(.red)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .red))
                }
                
                Button("Salvar") {
                    if !taskTitle.isEmpty {
                        let taskType: TaskType = isHighPriority ? .highPriority : .normal
                        viewModel.addTask(title: taskTitle, type: taskType)
                        dismiss()
                    }
                }
                .disabled(taskTitle.isEmpty)
            }
            .navigationTitle("Adicionar Tarefa")
            .navigationBarItems(trailing: Button("Fechar") {
                dismiss()
            })
        }
    }
}

