//
//  LocuContact.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#contact
//

import UIKit
import ObjectMapper
import Nosce

class LocuContact: NSObject, Mappable {
    var phone: String!
    var fax: String!
    var email: String!
    var businessOwner: String!
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        phone <- map["phone"]
        fax <- map["fax"]
        email <- map["email"]
        businessOwner <- map["business_owner"]
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Contact:", tab: 0)
    }
}
