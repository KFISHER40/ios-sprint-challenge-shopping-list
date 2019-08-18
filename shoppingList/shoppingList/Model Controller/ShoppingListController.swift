//
//  ShoppingListController.swift
//  shoppingList
//
//  Created by Lisa Fisher on 8/17/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController {
    var itemNames: [ShoppingItem] {
        var temp = [
            ShoppingItem(name: "apple", itemAdded: false),
            ShoppingItem(name: "grapes", itemAdded: false),
            ShoppingItem(name: "milk", itemAdded: false),
            ShoppingItem(name: "muffin", itemAdded: false),
            ShoppingItem(name: "popcorn", itemAdded: false),
            ShoppingItem(name: "soda", itemAdded: false),
            ShoppingItem(name: "strawberries", itemAdded: false),
        ]

    let wasItemAddedKey = UserDefaults.standard.bool(forKey: String.wasItemAddedKey)
    if wasItemAddedKey {
    temp.append(ShoppingItem(name: "", itemAdded: false))
    }
    
    return temp
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
