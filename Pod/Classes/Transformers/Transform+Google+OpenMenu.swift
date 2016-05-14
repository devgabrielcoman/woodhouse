//
//  Transform+Google+OpenMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 18/04/2016.
//
//

import UIKit
import KeyPathTransformer
import Dollar

func mapGoogleToOMenu(locu: [String:AnyObject]) -> [String:AnyObject] {
    
    let woodhouse_id = String.createUUID(32)
    let t = Transform<AnyObject>(locu)
    
    // [OK] metadata
    t["uuid"] = String.createOmfUUID()
    t["accuracy"] = 1
    t["created_date"] = NSDate.omfNowDate()
    t["open_menu.version"] = "1.6"
    
    // [OK] restaurant info
    // details subset
    t["restaurant_info.restaurant_name"] = t["name"]
    t["restaurant_info.brief_description"] = ""
    t["restaurant_info.business_type"] = "independent"
    
    // location subset
    t["restaurant_info.address_1"] = t["restaurant.location.address"]
    t["restaurant_info.city_town"] = t["restaurant.location.city"]
    t["restaurant_info.country"] = t["restaurant.location.country_id"]
    t["restaurant_info.postal_code"] = t["restaurant.location.zipcode"]
    t["restaurant_info.latitude"] = t["geometry.location.lat"]
    t["restaurant_info.longitude"] = t["geometry.location.lng"]
    
    // contact subset
    t["restaurant_info.phone"] = t["formatted_phone_number"]
    t["restaurant_info.website_url"] = t["website"]
    t["restaurant_info.omf_file_url"] = "http://sa-test-moat.herokuapp.com/static/sample.xml"
    
    // [OK] Environment
    // cuisine_type_primary subset
    t["restaurant_info.environment.cuisine_type_primary"] = t["restaurant.cuisines"]
    
    // seating_locations subset
    t["restaurant_info.environment.seating_locations"] = ["indoor"]
    
    // accepted_currencies subset
    var accepted_currencies: [String] = []
    if let symbol = t["restaurant.currency"] as? String {
        accepted_currencies.append(symbol)
    }
    if accepted_currencies.count == 0 {
        accepted_currencies.append("USD")
    }
    t["restaurant_info.environment.accepted_currencies"] = accepted_currencies
    
    // operating days subset
    t["operating_days"] = []
    
    return t.result()
}
