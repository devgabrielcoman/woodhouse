//
//  LocuRestaurant.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/
//

import UIKit
import ObjectMapper
import Dollar
import Nosce

class LocuRestaurant: NSObject, Mappable {
    var locuId: String!
    var name: String!
    var shortName: String!
    var restaurantDescription: String!
    var websiteURL: String!
    var menuURL: String!
    var redirectedFrom: String!
    
    var categories: [LocuCategory] = []    // init array as empty, but valid
    var location: LocuLocation?
    var contact: LocuContact?
    var openHours: LocuHours?
    var delivery: LocuDelivery?
    var external: LocuExternalIDs?
    var extended: LocuExtended?
    var media: LocuMedia?
    var menus: [LocuMenu] = []
    
    required init?(_ map: Map) {
        
    }
    
    override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        locuId <- map["locu_id"]
        name <- map["name"]
        shortName <- map["short_map"]
        restaurantDescription <- map["description"]
        websiteURL <- map["website_url"]
        menuURL <- map["menu_url"]
        redirectedFrom <- map["redirected_from"]
        categories <- map["categories"]
        location <- map["location"]
        openHours <- map["open_hours"]
        contact <- map["contact"]
        delivery <- map["delivery"]
        extended <- map["extended"]
        menus <- map["menus"]
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "General:", tab: 0, fields: ["locuId", "name", "shortName", "restaurantDescription", "websiteURL", "menuURL", "redirectedFrom"])
        $.each(categories) { (index, category: LocuCategory) in
            category.printModel()
        }
        location?.printModel()
        contact?.printModel()
        openHours?.printModel()
        delivery?.printModel()
        extended?.printModel()
        $.each(menus) { (index, menu: LocuMenu) in
            menu.printModel()
        }
        print("####################")
    }
}
