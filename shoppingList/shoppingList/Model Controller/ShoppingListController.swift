//
//  ShoppingListController.swift
//  shoppingList
//
//  Created by Lisa Fisher on 8/17/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import Foundation

class ShoppingListController {
        var itemNames = [
            ShoppingItem(name: "Apple", imageName: "apple"),
            ShoppingItem(name: "Grapes", imageName: "grapes"),
            ShoppingItem(name: "Milk", imageName: "milk"),
            ShoppingItem(name: "Muffin", imageName: "muffin"),
            ShoppingItem(name: "Popcorn", imageName: "popcorn"),
            ShoppingItem(name: "Soda", imageName: "soda"),
            ShoppingItem(name: "Strawberries", imageName: "strawberries"),
        ]


    private(set) var items: [ShoppingItem] = []

    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }

        return documents.appendingPathComponent("items.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }

    @discardableResult func addItem(named name: String, withImage imageName: String, itemAdded: Bool) -> ShoppingItem {

        let item = ShoppingItem(name: name, imageName: imageName)
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
