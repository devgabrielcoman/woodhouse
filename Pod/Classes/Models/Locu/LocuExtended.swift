//
//  LocuExtended.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#extended
//

import UIKit
import ObjectMapper
import Nosce

class LocuExtended: NSObject, Mappable {
    var establishedDate: String!
    var closedDate: String!
    var closedPermanently: Bool!
    var paymentMethods: LocuPaymentMethods?
    var cashOnly: Bool!
    var history: String!
    // beer_and_wine, full_bar, no_alcohol. --> capitalised and remove "_"
    var alcohol: String!
    // garage, lot, street, valet, validated --> capitalised
    var parking: [String] = []
    // One of: free, paid, no --> capitalised
    var wifi: String!
    // One of: free, paid, no --> Capitalised
    var corkage: String!
    // vegetarian, vegan, kosher, halal, dairy-free, gluten-free, soy-free --> Capitalised and remove "-"
    var dietaryRestrictions: [String] = []
    // dj, live, jukebox, background_music, karaoke, no_music --> Capitalised, remove "_"
    var music: [String] = []
    // soccer, basketball, hockey, football, baseball, mma, other --> Capitalised
    var sports: [String] = []
    var wheelchairAccessible: Bool!
    var reservations: Bool!
    var outdoorSeating: Bool!
    var goodForKids: Bool!
    var goodForGroups: Bool!
    // breakfast, brunch, dinner, lunch. --> Capitalised
    var meals: [String] = []
    var takeout: Bool!
    var smoking: Bool!
    // quiet, typical, loud --> Capitalised
    var noiseLevel: [String] = []
    var minimumAge: Int!
    var specialties: String!
    // dress, formal, casual --> Capitalised
    var attire: String!
    var waiterService: Bool!
    var television: Bool!
    var caters: Bool!
    // classy, romantic, upscale, touristy, trendy, casual --> Capitalised
    var ambience: [String] = []
    var priceRange: LocuPriceRange?
    var currency: LocuCurrency?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        establishedDate <- map["established_date"]
        closedDate <- map["closed_date"]
        closedPermanently <- map["closed_permanently"]
        paymentMethods <- map["payment_methods"]
        cashOnly <- map["cash_only"]
        history <- map["history"]
        alcohol <- map["alcohol"]
        parking <- map["parking"]
        wifi <- map["wifi"]
        corkage <- map["corkage"]
        dietaryRestrictions <- map["dietary_restrictions"]
        music <- map["music"]
        sports <- map["sports"]
        wheelchairAccessible <- map["wheelchair_accessible"]
        reservations <- map["reservations"]
        outdoorSeating <- map["outdoor_seating"]
        goodForKids <- map["good_for_kids"]
        goodForGroups <- map["good_for_groups"]
        meals <- map["meals"]
        takeout <- map["takeout"]
        smoking <- map["smoking"]
        noiseLevel <- map["noise_level"]
        minimumAge <- map["minimum_age"]
        specialties <- map["specialties"]
        attire <- map["attire"]
        waiterService <- map["waiter_service"]
        television <- map["television"]
        caters <- map["caters"]
        ambience <- map["ambience"]
        priceRange <- map["price_range"]
        currency <- map["currency"]
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Extended", tab: 0, exceptFields: ["priceRange","currency","paymentMethods"])
        priceRange?.printModel()
        currency?.printModel()
        paymentMethods?.printModel()
    }
}
