//
//  OrderViewController.swift
//  PizzaareaClient
//
//  Created by Benedikt Kurz on 03.04.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    var order: Order?
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var activityView: activityIndicator!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityView.startLoading()

        navigationItem.title = order?.pizza.name
        
        switch order!.status {
        case .pending:
            status.text = "Processing Order"
        case .accepted:
            status.text = "Preparing Order"
        case .dispatched:
            status.text = "Order is on its way"
        case .delivered:
            status.text = "Order delivered"
            activityView.strokeColor = UIColor.green
            activityView.completeLoading(success: true)
       
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

}
