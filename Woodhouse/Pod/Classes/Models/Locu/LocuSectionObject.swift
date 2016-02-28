//
//  LocuSectionObject.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//  as defined in https://dev.locu.com/documentation/#menu
//

import UIKit
import ObjectMapper
import Dollar

class LocuSectionObject: NSObject, Mappable {
    var type: String?
    var text: String?
    var name: String?
    var objectDescription: String?
    var price: String?
    var optionGroups: [LocuOptionGroupObject]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        text <- map["text"]
        name <- map["name"]
        objectDescription <- map["description"]
        price <- map["price"]
        optionGroups <- map["option_groups"]
    }
    
    func printModel() {
        if let t = type {
            print("\t\t\t\ttype: \(t)")
        }
        if let te = text {
            print("\t\t\t\ttext: \(te)")
        }
        if let n = name {
            print("\t\t\t\tname: \(n)")
        }
        if let descr = objectDescription {
            print("\t\t\t\tdescription: \(descr)")
        }
        if let pr = price {
            print("\t\t\t\tprice: \(pr)")
        }
        if let opt = optionGroups {
            print("\t\t\t\toptions [\(opt.count)]")
            $.each(opt) { (index, option) in
                (option as LocuOptionGroupObject).printModel()
            }
        }
        print("\t\t\t\t---")
    }
}
