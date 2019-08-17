//
//  ShoppingList.swift
//  shoppingList
//
//  Created by Lisa Fisher on 8/17/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    
    var name: String
    var image: UIImage
    var itemAdded: Bool
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
    }

}
