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
    
    var items = [String]()
    
    @IBAction func add(_ sender: Any) {
        print("Added Item")
        
        if let item = itemInput.text {
            print("append")
            
            items.append(item)
            
            UserDefaults.standard.set(items, forKey: "items")
            
            itemInput.text = ""
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        UserDefaults.standard.removeObject(forKey: "items")
        if UserDefaults.standard.array(forKey: "items") != nil {
            items = (UserDefaults.standard.array(forKey: "items") as? Array)!
        }
        
    }
    
    // Hide keyboard when text field is not in focus
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
         print(items)
        
        if let test = UserDefaults.standard.array(forKey: "items") {
            print(test)
        }
        
    }
    
    // Hide keyboard when hit return on virtual keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("UPDATING 2")
        print(UserDefaults.standard.array(forKey: "items"))
        
        if UserDefaults.standard.array(forKey: "items") != nil {
            items = (UserDefaults.standard.array(forKey: "items") as? Array)!
        }
    }


}

