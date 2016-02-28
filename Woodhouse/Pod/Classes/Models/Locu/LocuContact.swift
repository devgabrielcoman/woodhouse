//
//  LocuContact.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//
//

import UIKit
import ObjectMapper

class LocuContact: NSObject, Mappable {
    var phone: String?
    var fax: String?
    var email: String?
    var businessOwner: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        phone <- map["phone"]
        fax <- map["fax"]
        email <- map["email"]
        businessOwner <- map["business_owner"]
    }
    
    func printModel() {
        print("contact")
        print("\tphone: \(phone)")
        print("\tfax: \(fax)")
        print("\temail: \(email)")
        print("\tbusinessOwner: \(businessOwner)")
    }
}
