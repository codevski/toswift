//
//  SecondViewController.swift
//  ToSwift
//
//  Created by Sash Petrovski on 25/9/18.
//  Copyright © 2018 Gitup. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemInput: UITextField!
    
    @IBAction func add(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            
            items.append(itemInput.text!)
        } else {
            items = [itemInput.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        // Reset the Text Field
        itemInput.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // Hide keyboard when text field is not in focus
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    // Hide keyboard when hit return on virtual keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}

