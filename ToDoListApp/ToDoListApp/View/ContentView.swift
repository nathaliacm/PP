//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Nathalia Cardoso.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    @State private var showingAddTaskView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.tasks, id: \.id) { task in
                        TaskRow(task: task, toggleCompletion: {
                            viewModel.toggleTaskCompletion(task: task)
                        })
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
                
                Button(action: {
                    showingAddTaskView.toggle()
                }) {
                    Text("Adicionar Tarefa")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .sheet(isPresented: $showingAddTaskView) {
                    AddTaskView(viewModel: viewModel)
                }
                
                Spacer()
            }
            .navigationTitle("To-Do List")
        }
    }
}

#Preview {
    ContentView()
}
