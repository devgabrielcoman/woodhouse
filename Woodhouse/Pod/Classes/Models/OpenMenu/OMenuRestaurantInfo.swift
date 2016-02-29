//
//  RestaurantInfo.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//  as defined in http://openmenu.org/openmenu-format.php
//

import UIKit
import ObjectMapper

class OMenuRestaurantInfo: NSObject, Mappable {
    var restaurantName: String!
    var briefDescription: String!
    var fullDescription: String!
    var locationId: Int32!
    var mobile: Bool!
    var address1: String!
    var address2: String!
    var cityTown: String!
    var stateProvince: String!
    var postalCode: String!
    var country: String!
    var phone: String!
    var fax:String!
    var longitude:Float!
    var latitude:Float!
    var businessType:String!
    var utcOffset:String!
    var websiteUrl:String!
    var fileUrl:String!
    
    required init?(_ map: Map){
        
    }
    
    override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        restaurantName <- map["restaurant_name"]
        briefDescription <- map["brief_description"]
        fullDescription <- map["full_description"]
        locationId <- map["location_id"]
        mobile <- map["mobile"]
        address1 <- map["address_1"]
        address2 <- map["address_2"]
        cityTown <- map["city_town"]
        stateProvince <- map["state_province"]
        postalCode <- map["postal_code"]
        country <- map["country"]
        phone <- map["phone"]
        fax <- map["fax"]
        longitude <- map["longitude"]
        latitude <- map["latitude"]
        businessType <- map["business_type"]
        utcOffset <- map["utc_offset"]
        websiteUrl <- map["website_url"]
        fileUrl <- map["omf_file_url"]
    }
    
    func printModel () {
        print("restaurant info: ")
        let mirrored = Mirror(reflecting: self)
        for (_, attr) in mirrored.children.enumerate() {
            if let property_name = attr.label as String! {
                print("\t|-- \(property_name) = \(attr.value)")
            }
        }
    }
}
