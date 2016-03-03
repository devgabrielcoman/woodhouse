//
//  Restaurant.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//  as defined in http://openmenu.org/openmenu-format.php
//

import UIKit

import ObjectMapper
import Nosce
import Dollar

class OMenuRestaurant: NSObject, Mappable {
    var uuid: String!
    var accuracy: String!
    var privacy: Bool!
    var version: String!
    var updatedTimestamp: Int32!
    var restaurantInfo: OMenuRestaurantInfo?
    var environmentInfo: OMenuEnvironmentInfo?
    var menus: [OMenuMenu] = []
    
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
        Nosce.printObject(reflecting: self, alias: "OMenu Info", tab: 0, fields: ["uuid", "accuracy", "privacy", "version", "updatedTimestamp"])
        restaurantInfo?.printModel()
        environmentInfo?.printModel()
        $.each(menus) { (index, menu: OMenuMenu) in
            menu.printModel()
        }
    }
}
