//
//  Transform+Foursquare+OpenMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 03/04/2016.
//
//

import UIKit
import KeyPathTransformer
import Dollar

func mapFoursquareToOMenu(foursquare: [String:AnyObject]) -> [String:AnyObject] {
    
    let woodhouse_id = String.createUUID(32)
    let t = Transform<AnyObject>(foursquare)
    
    // [OK] OMF metadata
    t["woodhouse_id"] = woodhouse_id
    t["omf_uuid"] = String.createOmfUUID()
    t["omf_accuracy"] = 1
    t["omf_private"] = false
    t["omf_version"] = "1.6.2"
    t["omf_updated_timestamp"] = NSDate.omfNowDate()
    t["force_ads"] = false
    
    // [OK] Restaurant info
    t["restaurant_info.restaurant_name"] = t["name"]
    t["restaurant_info.brief_description"] = t["description"]
    t["restaurant_info.full_description"] = t["description"]
    t["restaurant_info.address_1"] = t["location.address"]
    t["restaurant_info.city_town"] = t["location.city"]
    t["restaurant_info.postal_code"] = t["location.postalCode"]
    t["restaurant_info.country"] = t["location.country"]
    t["restaurant_info.longitude"] = t["location.lng"]
    t["restaurant_info.latitude"] = t["location.lat"]
    t["restaurant_info.phone"] = t["contact.phone"]
    t["restaurant_info.website_url"] = t["url"]
    t["restaurant_info.business_type"] = "independent"
    t["restaurant_info.location_id"] = String.createUUID(25)
    t["restaurant_info.mobile"] = false
    t["restaurant_info.omf_file_url"] = "https://woodhouse.com/\(woodhouse_id)"
    
    // [OK] environment info
    t["environment_info.seating_qty"] = 0
    t["environment_info.max_group_size"] = 0
    t["environment_info.pets_allowed"] = false
    t["environment_info.cuisine_type_primary"] = {
        var array:[String] = []
        t["categories"] => { (i, category: Transform<AnyObject>) in
            if let category = category["name"] as? String {
                array.append(category)
            }
        }
        return array.joinWithSeparator(" / ")
        }()
    
    return t.result()
}
