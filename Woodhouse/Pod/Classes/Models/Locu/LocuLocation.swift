//
//  LocuLocation.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#location
//

import UIKit
import ObjectMapper

class LocuLocation: NSObject, Mappable {
    var address1: String!
    var address2: String!
    var address3: String!
    var locality: String!
    var region: String!
    var postalCode: String!
    var country: String!
    var geo: LocuGeo?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        address1 <- map["address1"]
        address2 <- map["address2"]
        address3 <- map["address3"]
        locality <- map["locality"]
        region <- map["region"]
        postalCode <- map["postal_code"]
        country <- map["country"]
        geo <- map["geo"]
    }
    
    func printModel() {
        print("location: ")
        let mirrored = Mirror(reflecting: self)
        for (_, attr) in mirrored.children.enumerate() {
            if let property_name = attr.label as String! {
                if property_name != "geo" {
                    print("\t|-- \(property_name) = \(attr.value)")
                } else {
                    geo?.printModel()
                }
            }
        }
    }
}
