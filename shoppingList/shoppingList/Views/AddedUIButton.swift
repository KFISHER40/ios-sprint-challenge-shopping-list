//
//  AddedUIButton.swift
//  shoppingList
//
//  Created by Lisa Fisher on 8/18/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import UIKit

class AddedUIButton: UIButton {

    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        setTitle("Added", for: .normal)
        addTarget(self, action: #selector(AddedUIButton.buttonPressed), for: .touchUpInside)
    }

    @objc func buttonPressed() {
        activateButton(bool: isOn)
}
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let title = bool ? "Added" : "Not Added"
        
        setTitle(title, for: .normal)
    }
}
