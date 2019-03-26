//
//  PizzaListTableViewController.swift
//  PizzaareaClient
//
//  Created by Benedikt Kurz on 26.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import Alamofire

class PizzaListTableViewController: UITableViewController {
    
    var pizzas: [Pizza] = []
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Select Pizza"
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    private func fetchInventory(completion: @escaping ([Pizza]?) -> Void ) {
        
        
        Alamofire.request("http://172.17.26.104:4000/inventory", method: .get)
        
        .validate()
            .responseJSON {
                response in guard response.result.isSuccess else {
                   return completion(nil)
                    }
                
                
                guard let rawInventory = response.result.value as? [[String: Any]?] else {
                    
                    completion(nil)
                    
                }
                
                let inventory = rawInventory.flatMap(pizzaDict -> Pizza? in
                
                var data = pizzaDict!
                
                )
                
                
                
        }
        
        
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}