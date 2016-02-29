//
//  LocuSectionObject.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//  as defined in https://dev.locu.com/documentation/#menu
//

import UIKit
import ObjectMapper
import Dollar

class LocuSectionObject: NSObject, Mappable {
    var type: String!
    var text: String!
    var name: String!
    var objectDescription: String!
    var price: String!
    var optionGroups: [LocuOptionGroupObject] = []
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        text <- map["text"]
        name <- map["name"]
        objectDescription <- map["description"]
        price <- map["price"]
        optionGroups <- map["option_groups"]
    }
    
    func printModel() {
        print("\t\t\t|-- object: ")
        print("\t\t\t\t|-- type: \(type)")
        print("\t\t\t\t|-- text: \(text)")
        print("\t\t\t\t|-- name: \(name)")
        print("\t\t\t\t|-- description: \(objectDescription)")
        print("\t\t\t\t|-- price: \(price)")
        $.each(optionGroups) { (index, option: LocuOptionGroupObject) in
            option.printModel()
        }
    }
}
