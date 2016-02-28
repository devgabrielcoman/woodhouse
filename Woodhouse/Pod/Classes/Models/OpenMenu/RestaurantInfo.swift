//
//  RestaurantInfo.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//  as defined in http://openmenu.org/openmenu-format.php
//

import UIKit
import ObjectMapper

class RestaurantInfo: NSObject, Mappable {
    var restaurant_name: String?
    var brief_description: String?
    var full_description: String?
    var location_id: Int32?
    var mobile: String?
    var address_1: String?
    var address_2: String?
    var city_town: String?
    var state_province: String?
    var postal_code: String?
    var country: String?
    var phone: String?
    var fax:String?
    var longitude:Double?
    var latitude:Double?
    var business_type:String?
    var utc_offset:String?
    var website_url:String?
    var omf_file_url:String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        restaurant_name <- map["restaurant_name"]
        brief_description <- map["brief_description"]
        full_description <- map["full_description"]
        location_id <- map["location_id"]
        mobile <- map["mobile"]
        address_1 <- map["address_1"]
        address_2 <- map["address_2"]
        city_town <- map["city_town"]
        state_province <- map["state_province"]
        postal_code <- map["postal_code"]
        country <- map["country"]
        phone <- map["phone"]
        fax <- map["fax"]
        longitude <- map["longitude"]
        latitude <- map["latitude"]
        business_type <- map["business_type"]
        utc_offset <- map["utc_offset"]
        website_url <- map["website_url"]
        omf_file_url <- map["omf_file_url"]
    }
}
