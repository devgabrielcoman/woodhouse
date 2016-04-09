//
//  Transform+CityGrid+OpenMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 09/04/2016.
//
//

import UIKit
import KeyPathTransformer

func mapCityGridToOMenu(citygrid: [String:AnyObject]) -> [String:AnyObject] {
    let woodhouse_id = String.createUUID(32)
    let t1 = Transform<AnyObject>(citygrid)
    
    // [OK] OMF metadata
    t1["woodhouse_id"] = woodhouse_id
    t1["omf_uuid"] = String.createOmfUUID()
    t1["omf_accuracy"] = 1
    t1["omf_private"] = false
    t1["omf_version"] = "1.6.2"
    t1["omf_updated_timestamp"] = NSDate.omfNowDate()
    t1["force_ads"] = false
    
    // [OK] Restaurant info
    t1["restaurant_info.restaurant_name"] = t1["name"]
    t1["restaurant_info.brief_description"] = t1["teaser"]
    t1["restaurant_info.full_description"] = t1["teaser"]
    t1["restaurant_info.address_1"] = t1["address.street"]
    t1["restaurant_info.city_town"] = t1["address.city"]
    t1["restaurant_info.state_province"] = t1["address.state"]
    t1["restaurant_info.postal_code"] = t1["address.postal_code"]
    t1["restaurant_info.country"] = ""
    t1["restaurant_info.phone"] = t1["contact_info.display_phone"]
    t1["restaurant_info.fax"] = t1["fax_number"]
    t1["restaurant_info.longitude"] = t1["address.longitude"]
    t1["restaurant_info.latitude"] = t1["address.latitude"]
    t1["restaurant_info.website_url"] = t1["contact_info.display_url"]
    t1["restaurant_info.business_type"] = "independent"
    t1["restaurant_info.location_id"] = String.createUUID(25)
    t1["restaurant_info.mobile"] = false
    t1["restaurant_info.omf_file_url"] = "https://woodhouse.com/\(woodhouse_id)"
    
    return t1.result()
}
