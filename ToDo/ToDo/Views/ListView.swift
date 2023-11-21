//
//  ListView.swift
//  ToDo
//
//  Created by 詹子昊 on 11/20/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var list: ListViewModel

    var body: some View {
        ZStack{
            if list.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(list.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    list.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: list.deleteItem)
                    .onMove(perform: list.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
        .font(.title2)
    }
    
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}


