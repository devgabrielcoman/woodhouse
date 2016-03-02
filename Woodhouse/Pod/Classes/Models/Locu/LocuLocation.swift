//
//  LocuLocation.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#location
//

import UIKit
import ObjectMapper
import Nosce

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
        Nosce.printObject(reflecting: self, alias: "Location:", tab: 0, exceptFields: ["geo"])
        geo?.printModel()
    }
}
