//
//  LocuCurrency.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#extended
//

import UIKit
import ObjectMapper
import Nosce

class LocuCurrency: NSObject, Mappable {
    var symbol: String!
    var name: String!
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        symbol <- map["symbol"]
        name <- map["name"]
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Currency:", tab: 1)
    }
}
