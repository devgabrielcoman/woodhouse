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

class LocuRestaurant: NSObject, Mappable {
    var locuId: String?
    var name: String?
    var shortName: String?
    var restaurantDescription: String?
    var websiteURL: String?
    var menuURL: String?
    var redirectedFrom: String?
    var openHours: LocuHours?
    var external: LocuExternalIDs?
    var categories: [LocuCategory]?
    var location: LocuLocation?
    var contact: LocuContact?
    var delivery: LocuDelivery?
    var extended: LocuExtended?
    var media: LocuMedia?
    var menus: [LocuMenu]?
    
    required init?(_ map: Map) {
        
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
        print("locuId: \(locuId)")
        print("name: \(name)")
        print("shortName: \(shortName)")
        print("description: \(restaurantDescription)")
        print("websiteURL: \(websiteURL)")
        print("menuURL: \(menuURL)")
        print("redirectedFrom: \(redirectedFrom)")
        if let cat = categories {
            print("categories [\(cat.count)]")
            $.each(cat) { (index, category) in
                (category as LocuCategory).printModel()
            }
        }
        if let loc = location {
            loc.printModel()
        }
        if let oh = openHours {
            oh.printModel()
        }
        if let co = contact {
            co.printModel()
        }
        if let del = delivery {
            del.printModel()
        }
        if let ext = extended {
            ext.printModel()
        }
        if let m = menus {
            print("menus [\(m.count)]")
            $.each(m) { (index, menu) in
                (menu as LocuMenu).printModel()
            }
        }
        print("------------------")
    }
}
