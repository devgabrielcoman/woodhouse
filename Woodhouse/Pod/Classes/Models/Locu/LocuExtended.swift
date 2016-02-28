//
//  LocuExtended.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#extended
//

import UIKit
import ObjectMapper;

class LocuExtended: NSObject, Mappable {
    var establishedDate: String?
    var closedDate: String?
    var closedPermanently: Bool?
    var paymentMethods: LocuPaymentMethods?
    var cashOnly: Bool?
    var history: String?
    var alcohol: String? // beer_and_wine, full_bar, no_alcohol. --> capitalised and remove "_"
    var parking: [String]? // garage, lot, street, valet, validated --> capitalised
    var wifi: String? // One of: free, paid, no --> capitalised
    var corkage: String? // One of: free, paid, no --> Capitalised
    var dietaryRestrictions: [String]? // vegetarian, vegan, kosher, halal, dairy-free, gluten-free, soy-free --> Capitalised and remove "-"
    var music: [String]? // dj, live, jukebox, background_music, karaoke, no_music --> Capitalised, remove "_"
    var sports: [String]? // soccer, basketball, hockey, football, baseball, mma, other --> Capitalised
    var wheelchairAccessible: Bool?
    var reservations: Bool?
    var outdoorSeating: Bool?
    var goodForKids: Bool?
    var goodForGroups: Bool?
    var meals: [String]? // breakfast, brunch, dinner, lunch. --> Capitalised
    var takeout: Bool?
    var smoking: Bool?
    var noiseLevel: [String]? // quiet, typical, loud --> Capitalised
    var minimumAge: Int?
    var specialties: String?
    var attire: String? // dress, formal, casual --> Capitalised
    var waiterService: Bool?
    var television: Bool?
    var caters: Bool?
    var ambience: [String]? // classy, romantic, upscale, touristy, trendy, casual --> Capitalised
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
        print("extended:")
        print("\testablishedDate: \(establishedDate)")
        print("\tclosedDate: \(closedDate)")
        print("\tclosedPermanently: \(closedPermanently)")
        print("\tcashOnly: \(cashOnly)")
        print("\thistory: \(history)")
        print("\talcohol: \(alcohol)")
        print("\tparking: \(parking)")
        print("\twifi: \(wifi)")
        print("\tcorkage: \(corkage)")
        print("\tdietaryRestrictions: \(dietaryRestrictions)")
        print("\tmusic: \(music)")
        print("\tsports: \(sports)")
        print("\twheelchairAccessible: \(wheelchairAccessible)")
        print("\treservations: \(reservations)")
        print("\toutdoorSeating: \(outdoorSeating)")
        print("\tgoodForKids: \(goodForKids)")
        print("\tgoodForGroups: \(goodForGroups)")
        print("\tmeals: \(meals)")
        print("\ttakeout: \(takeout)")
        print("\tsmoking: \(smoking)")
        print("\tnoiseLevel: \(noiseLevel)")
        print("\tminimumAge: \(minimumAge)")
        print("\tspecialties: \(specialties)")
        print("\tattire: \(attire)")
        print("\twaiterService: \(waiterService)")
        print("\ttelevision: \(television)")
        print("\tcaters: \(caters)")
        print("\tambience: \(ambience)")
        if let pr = priceRange {
            pr.printModel()
        }
        if let cur = currency {
            cur.printModel()
        }
        if let pay = paymentMethods {
            pay.printModel()
        }
    }
}
