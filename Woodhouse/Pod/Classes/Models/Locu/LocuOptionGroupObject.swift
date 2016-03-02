//
//  LocuOptionGrouoObject.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//  as defined in https://dev.locu.com/documentation/#menu
//

import UIKit
import ObjectMapper
import Dollar
import Nosce

class LocuOptionGroupObject: NSObject, Mappable {
    var type: String!
    var text: String!
    var options: [LocuOptionObject] = []
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        text <- map["text"]
        options <- map["options"]
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Option Group:", tab: 4, exceptFields: ["options"])
        $.each(options) { (index, option: LocuOptionObject) in
            option.printModel()
        }
    }
}
