//
//  LocuMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//  as defined in https://dev.locu.com/documentation/#menu
//

import UIKit
import ObjectMapper
import Dollar

class LocuMenu: NSObject, Mappable {
    var menuName: String!
    var currencySymbol: String!
    var sections: [LocuSection] = []
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        menuName <- map["menu_name"]
        currencySymbol <- map["currency_symbol"]
        sections <- map["sections"]
    }
    
    func printModel() {
        print("menu: ")
        print("\t|-- menuName: \(menuName)")
        print("\t|-- currencySymbol: \(currencySymbol)")
        $.each(sections) { (index, section: LocuSection) in
            section.printModel()
        }
    }
}
