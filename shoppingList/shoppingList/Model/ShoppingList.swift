//
//  ShoppingList.swift
//  shoppingList
//
//  Created by Lisa Fisher on 8/17/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable {
    
    var name: String
    var itemAdded: Bool
    
    init(name: String, itemAdded: Bool) {
        self.name = name
        self.itemAdded = itemAdded
    }
}
