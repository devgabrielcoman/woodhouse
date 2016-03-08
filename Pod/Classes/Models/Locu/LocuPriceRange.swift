//
//  LocuPriceRange.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#extended
//

import UIKit
import ObjectMapper
import Nosce

class LocuPriceRange: NSObject, Mappable {
    var low: String!
    var high: String!
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        low <- map["low"]
        high <- map["high"]
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Price Rage:", tab: 1)
    }
}
