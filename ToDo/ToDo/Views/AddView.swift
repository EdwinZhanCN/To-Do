//
//  AddView.swift
//  ToDo
//
//  Created by 詹子昊 on 11/20/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFielText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            ///remember to add the backgroundColor for text Field
            VStack {
                TextField("Type something here...", text: $textFielText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFielText)
            presentationMode.wrappedValue.dismiss()
        }
       
    }
    
    func textIsAppropriate() -> Bool{
        if textFielText.count < 3{
            alertTitle = "Your new todo item must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
