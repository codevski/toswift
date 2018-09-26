//
//  FirstViewController.swift
//  ToSwift
//
//  Created by Sash Petrovski on 25/9/18.
//  Copyright © 2018 Gitup. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var totalItems = UserDefaults.standard.array(forKey: "items")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return totalItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = (totalItems![indexPath.row] as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            print("Need To Delete \(totalItems![indexPath.row])")
            totalItems!.remove(at: indexPath.row)
            UserDefaults.standard.set(totalItems, forKey: "items")
            viewDidAppear(true)
        }
    }
    
    func updateItems() {
        totalItems = UserDefaults.standard.array(forKey: "items")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("UPDATING 1")
        updateItems()
        self.table.reloadData()
        
    }


}

