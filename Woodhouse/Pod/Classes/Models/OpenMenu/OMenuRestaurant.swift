//
//  Restaurant.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//  as defined in http://openmenu.org/openmenu-format.php
//

import UIKit

import ObjectMapper

class OMenuRestaurant: NSObject, Mappable {
    var uuid: String!
    var accuracy: String!
    var privacy: Bool!
    var version: String!
    var updatedTimestamp: Int32!
    var restaurantInfo: OMenuRestaurantInfo?
    
    required init?(_ map: Map){
        
    }
    
    override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        uuid <- map["omf_uuid"]
        accuracy <- map["omf_accuracy"]
        privacy <- map["omf_private"]
        version <- map["omf_version"]
        updatedTimestamp <- map["omf_updated_timestamp"]
    }
    
    func printModel() {
        print("omenu info:")
        let mirrored = Mirror(reflecting: self)
        for (_, attr) in mirrored.children.enumerate() {
            if let property_name = attr.label as String! {
                if property_name == "restaurantInfo" {
                    restaurantInfo?.printModel()
                } else {
                    print("\t|-- \(property_name) = \(attr.value)")
                }
            }
        }
    }
}
