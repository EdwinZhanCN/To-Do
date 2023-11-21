//
//  ToDoApp.swift
//  ToDo
//
//  Created by 詹子昊 on 11/20/23.
//

import SwiftUI
@main
struct ToDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
