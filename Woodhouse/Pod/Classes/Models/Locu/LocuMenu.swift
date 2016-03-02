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
import Nosce

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
        Nosce.printObject(reflecting: self, alias: "Menu: ", tab: 0, exceptFields: ["sections"])
        $.each(sections) { (index, section: LocuSection) in
            section.printModel()
        }
    }
}
