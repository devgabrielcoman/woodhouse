//
//  LocuOptionObject.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//  as defined in https://dev.locu.com/documentation/#menu
//

import UIKit
import ObjectMapper

class LocuOptionObject: NSObject, Mappable {
    var name: String!
    var price: String!
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        price <- map["price"]
    }
    
    func printModel() {
        print("\t\t\t\t\t|-- option object: ")
        print("\t\t\t\t\t\t|-- name: \(name)")
        print("\t\t\t\t\t\t|-- price: \(price)")
    }
}
