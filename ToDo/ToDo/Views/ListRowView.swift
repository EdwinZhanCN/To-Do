//
//  ListRowView.swift
//  ToDo
//
//  Created by 詹子昊 on 11/20/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: Item
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(item: Item(title: "First", isCompleted: false))
}
