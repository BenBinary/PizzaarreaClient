//
//  Order.swift
//  PizzaareaClient
//
//  Created by Benedikt Kurz on 26.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation

struct Order {
    let id: String
    let pizza: Pizza
    var status: OrderStatus
    
    init(id: String, pizza: [String: Any], status: String) {
        
        self.id = id
        //self.pizza = pizza.
        self.status = status
        
    }
    
}
enum OrderStatus: String {
    case pending = "Pending"
    case accepted = "Accepted"
    case dispatched = "Dispatched"
    case delivered = "Delivered"
}


