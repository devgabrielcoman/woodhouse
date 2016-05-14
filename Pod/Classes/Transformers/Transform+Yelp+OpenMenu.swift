//
//  Transform+Yelp+OpenMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 17/04/2016.
//
//

import UIKit
import KeyPathTransformer
import Dollar

func mapYelpToOMenu(locu: [String:AnyObject]) -> [String:AnyObject] {
    
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
    t["location.address"] => { (i, address:String) in
        t["restaurant_info.address_1"] = address
    }
    t["restaurant_info.city_town"] = t["location.city"]
    t["restaurant_info.country"] = t["location.country"]
    t["restaurant_info.postal_code"] = t["location.country_code"]
    t["restaurant_info.longitude"] = t["location.coordinate.longitude"]
    t["restaurant_info.latitude"] = t["location.coordinate.latitude"]
    
    // contact subset
    t["restaurant_info.phone"] = t["phone"]
    t["restaurant_info.website_url"] = t["url"]
    t["restaurant_info.omf_file_url"] = "http://sa-test-moat.herokuapp.com/static/sample.xml"
    
    // [OK] Environment
    // cuisine_type_primary subset
    var fname: [String] = []
    t["categories"] => { (i, category:[String]) in
        if let first = category.first {
            fname.append(first)
        }
    }
    t["restaurant_info.environment.cuisine_type_primary"] = fname.joinWithSeparator(" / ")
    
    // seating_locations subset
    t["restaurant_info.environment.seating_locations"] = ["indoor"]
    
    // accepted_currencies subset
    t["restaurant_info.environment.accepted_currencies"] = ["USD"]

    // operating days subset
    t["operating_days"] = []
    
    return t.result()
}
