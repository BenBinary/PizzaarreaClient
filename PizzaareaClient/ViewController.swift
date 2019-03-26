//
//  ViewController.swift
//  PizzaareaClient
//
//  Created by Benedikt Kurz on 26.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var pizza: Pizza?
    
    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var pizzaDescription: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = pizza!.name
        pizzaImageView.image = pizza!.image
        pizzaDescription.text = pizza!.description
        amount.text = "$\(String(describing: pizza!.amount))"
        
        
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
        
        let parameters = ["pizza_id": pizza!.id, "user_id": "1355222"]
        
        Alamofire.request("http://172.17.26.104/orders", method: .post, parameters: parameters )
            
            .validate()
            .responseJSON { response in guard response.result.isSuccess else {
                return alertError() }
                
                guard let status = response.result.value as? [String: Bool],
                    
                    let successful = status["status"] else {
                        
                        return alertError()
                        
                }
                
                successful ? alertSuccess() : alertError()
                
        }
        
    }
    
    
}


private func alertError() {
    
    return alert(title: "Purchase unsuccessful!", message: "Unable to complete purchase please try later again")
    
}


private func alertSuccess() {
    
    return alert(title: "Purchase Successfull", message: "You have ordered sucessfully, your order will be confirmed soon.")
    
}

private func alert(title: String, message: String) {
    
    let alertCtrl = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    alertCtrl.addAction(
        UIAlertAction(title: "Okay", style: .cancel) {
            action in UINavigationController.popViewController(animated: true)
    })
    
    present(alertCtrl, animated: true, completion: nil)
}



