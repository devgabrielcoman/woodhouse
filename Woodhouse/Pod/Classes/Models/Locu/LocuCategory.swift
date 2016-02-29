//
//  LocuCategory.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#category
//

import UIKit
import ObjectMapper

class LocuCategory: NSObject, Mappable {
    var strId: String!
    var name: String!
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        strId <- map["str_id"]
        name <- map["name"]
    }
    
    func printModel() {
        print("category:")
        let mirrored = Mirror(reflecting: self)
        for (_, attr) in mirrored.children.enumerate() {
            if let property_name = attr.label as String! {
                print("\t|-- \(property_name) = \(attr.value)")
            }
        }
    }
}
