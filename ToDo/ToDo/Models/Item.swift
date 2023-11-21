//
//  ItemModel.swift
//  ToDo
//
//  Created by 詹子昊 on 11/20/23.
//

import Foundation


//Immutable Struct

struct Item: Identifiable, Codable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> Item {
        return Item(id: id, title: title, isCompleted: !isCompleted)
    }
}
