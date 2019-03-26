//
//  Pizza.swift
//  PizzaareaClient
//
//  Created by Benedikt Kurz on 26.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation
import UIKit


struct Pizza {
    let id: String
    let name: String
    let description: String
    let amount: Float
    let image: UIImage
    init(data: [String: Any]) {
        self.id = data["id"] as! String
        self.name = data["name"] as! String
        self.amount = data["amount"] as! Float
        self.description = data["description"] as! String
        self.image = data["image"] as! UIImage
    }
}
