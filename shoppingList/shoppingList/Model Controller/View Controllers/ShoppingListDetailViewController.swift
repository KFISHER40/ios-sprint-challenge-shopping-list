//
//  ShoppingListDetailViewController.swift
//  shoppingList
//
//  Created by Lisa Fisher on 8/17/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        }
    
    @IBAction func sendOrderButtonPressed(_ sender: Any) {
    }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


