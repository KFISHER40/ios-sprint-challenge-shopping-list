//
//  ShoppingListController.swift
//  shoppingList
//
//  Created by Lisa Fisher on 8/17/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import Foundation

class ShoppingListController {
    var planets: [ShoppingItem] {
        var itemNames = [
            ShoppingItem(name: "Apple", itemAdded: false),
            ShoppingItem(name: "Grapes", itemAdded: false),
            ShoppingItem(name: "Milk", itemAdded: false),
            ShoppingItem(name: "Muffin", itemAdded: false),
            ShoppingItem(name: "Popcorn", itemAdded: false),
            ShoppingItem(name: "Soda", itemAdded: false),
            ShoppingItem(name: "Strawberries", itemAdded: false),
        ]
        
        let wasItemAdded = UserDefaults.standard.bool(forKey: String.wasItemAddedKey)
        if wasItemAdded {
            itemNames.append(ShoppingItem(name: "", itemAdded: true))
        }
        
        return itemNames
        
    }
    
    private(set) var items: [ShoppingItem] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("items.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    @discardableResult func addItem(named name: String, withItem itemAdded: Bool) -> ShoppingItem {
        
        let item = ShoppingItem(name: name, itemAdded: itemAdded)
        items.append(item)
        saveToPersistentStore()
        return item
    }
    
    func listItems() -> String {
        var output = ""
        for item in items {
            output += "\(item.name) has been added to the list"
        }
        return output
    }
    
    private func saveToPersistentStore() {
            guard let url = persistentFileURL else { return }
            
            do {
                let encoder = PropertyListEncoder()
                let data = try encoder.encode(items)
                try data.write(to: url)
            } catch {
                print("Error saving items data: \(error)")
            }
        }
    
    private func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            items = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading items data: \(error)")
        }
    }
}
