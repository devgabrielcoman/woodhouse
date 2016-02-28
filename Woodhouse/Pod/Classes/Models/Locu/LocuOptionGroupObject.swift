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

class LocuOptionGroupObject: NSObject, Mappable {
    var type: String?
    var text: String?
    var options: [LocuOptionObject]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        text <- map["text"]
        options <- map["options"]
    }
    
    func printModel() {
        if let t = type {
            print("\t\t\t\t\ttype: \(t)")
        }
        if let t = text {
            print("\t\t\t\t\ttext: \(t)")
        }
        if let o = options {
            print("\t\t\t\t\toptions [\(o.count)]")
            $.each(o) { (index, option) in
                (option as LocuOptionObject).printModel()
            }
        }
    }
}
