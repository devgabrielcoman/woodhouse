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
import Nosce

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
        Nosce.printObject(reflecting: self, alias: "Menu Object: ", tab: 3, exceptFields: ["optionGroups"])
        $.each(optionGroups) { (index, option: LocuOptionGroupObject) in
            option.printModel()
        }
    }
}
