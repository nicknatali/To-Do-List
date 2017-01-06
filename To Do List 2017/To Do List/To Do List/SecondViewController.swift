//
//  SecondViewController.swift
//  To Do List
//
//  Created by Nick Natali on 1/6/17.
//  Copyright © 2017 Make It Appen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    //IBOutlets
    @IBOutlet var itemTextField: UITextField!
  
    //Add items to list
    @IBAction func add(_ sender: Any) {
        
        //Store locally
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        //Array of strings
        var items:[String]
        
        //If there is a string entry, append it to the array
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(itemTextField.text!)
            
        } else {
            
            items = [itemTextField.text!]
            
        }
        //Save entry
        UserDefaults.standard.set(items, forKey: "items")
        //Reset Text Field
        itemTextField.text = ""
        
    }
    
    //User can touch outside of keyboard to hide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    //Return button hides keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
