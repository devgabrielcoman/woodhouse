//
//  Transform+Zomato+OpenMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 28/03/2016.
//
//

import UIKit
import KeyPathTransformer
import Dollar

func mapZomatoToOMenu(zomato: [String:AnyObject]) -> [String:AnyObject] {
    
    let woodhouse_id = String.createUUID(32)
    let t = Transform<AnyObject>(zomato)
    
    // [OK] OMF metadata
    t["woodhouse_id"] = woodhouse_id
    t["omf_uuid"] = String.createOmfUUID()
    t["omf_accuracy"] = 1
    t["omf_private"] = false
    t["omf_version"] = "1.6.2"
    t["omf_updated_timestamp"] = NSDate.omfNowDate()
    t["force_ads"] = false
    
    // [OK] Restaurant info
    t["restaurant_info.restaurant_name"] = t["restaurant.name"]
    t["restaurant_info.addres_1"] = t["restaurant.location.address"]
    t["restaurant_info.city_town"] = t["restaurant.location.locality"]
    t["restaurant_info.postal_code"] = t["restaurant.location.zipcode"]
    t["restaurant_info.country"] = t["restaurant.location.country_id"]
    t["restaurant_info.longitude"] = t["restaurant.location.longitude"]
    t["restaurant_info.latitude"] = t["restaurant.location.latitude"]
    t["restaurant_info.phone"] = t["restaurant.phone_numbers"]
    t["restaurant_info.website_url"] = t["restaurant.url"]
    t["restaurant_info.business_type"] = "independent"
    t["restaurant_info.location_id"] = String.createUUID(25)
    t["restaurant_info.mobile"] = false
    t["restaurant_info.omf_file_url"] = "https://woodhouse.com/\(woodhouse_id)"
    
    // [OK] environment info
    t["environment_info.seating_qty"] = 0
    t["environment_info.max_group_size"] = 0
    t["environment_info.pets_allowed"] = false
    t["environment_info.delivery_available"] = t["restaurant.has_online_delivery"]
    if let cusisines = t["restaurant.cuisines"] as? String {
        var c = cusisines.stringByReplacingOccurrencesOfString(", ", withString: " / ")
        t["environment_info.cuisine_type_primary"] = c
    }
    
    // [OK] currencies
    var accepted_currencies: [AnyObject] = []
    if let symbol = t["restaurant.currency"] as? String {
        accepted_currencies.append(["accepted_currency": symbol])
    }
    if accepted_currencies.count == 0 {
        accepted_currencies.append(["accepted_currency": "USD"])
    }
    t["accepted_currencies"] = accepted_currencies
    
    //
    // menus from https://developers.zomato.com/api/v2.1/dailymenu?res_id=16507624
    
    return t.result()
}
