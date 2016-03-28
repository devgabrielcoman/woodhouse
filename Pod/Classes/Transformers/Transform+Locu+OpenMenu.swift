//
//  Map+Locu+OpenMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 08/03/2016.
//
//

import UIKit
import KeyPathTransformer
import Dollar

func mapLocuToOMenu(locu: [String:AnyObject]) -> [String:AnyObject] {
    
    let woodhouse_id = String.createUUID(32)
    let t1 = Transform<AnyObject>(locu)
    
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
    t1["restaurant_info.brief_description"] = t1["description"]
    t1["restaurant_info.full_description"] = t1["description"]
    t1["restaurant_info.addres_1"] = t1["location.address1"]
    t1["restaurant_info.address_2"] = t1["location.address2"]
    t1["restaurant_info.city_town"] = t1["location.locality"]
    t1["restaurant_info.state_province"] = t1["location.region"]
    t1["restaurant_info.postal_code"] = t1["location.postal_code"]
    t1["restaurant_info.country"] = t1["location.country"]
    t1["restaurant_info.phone"] = t1["contact.phone"]
    t1["restaurant_info.fax"] = t1["contact.fax"]
    t1["restaurant_info.longitude"] = t1["location.geo.longitude"]
    t1["restaurant_info.latitude"] = t1["location.geo.latitude"]
    t1["restaurant_info.website_url"] = t1["website_url"]
    t1["restaurant_info.business_type"] = "independent"
    t1["restaurant_info.location_id"] = String.createUUID(25)
    t1["restaurant_info.mobile"] = false
    t1["restaurant_info.omf_file_url"] = "https://woodhouse.com/\(woodhouse_id)"
    
    // [OK] environment info
    t1["environment_info.seating_qty"] = 0
    t1["environment_info.smoking_allowed"] = t1["extended.smoking"]
    t1["environment_info.max_group_size"] = 0
    t1["environment_info.pets_allowed"] = false
    t1["environment_info.age_level_preference"] = t1["extended.minimum_age"]
    t1["environment_info.dress_code"] = t1["extended.attire"]
    t1["environment_info.takeout_available"] = t1["extended.takeout"]
    t1["environment_info.delivery_available"] = t1["delivery.will_deliver"]
    t1["environment_info.delivery_fee"] = t1["delivery.mimumum_order"]
    t1["environment_info.catering_available"] = t1["extended.caters"]
    t1["environment_info.wheelchair_accessible"] = t1["extended.weelchair_acessible"]
    t1["environment_info.reservations"] = t1["extended.reservations"]
    t1["environment_info.alcohol_type"] = t1["extended.acohol"]
    t1["extended.music"] => { (i, music: String) in
        t1["environment_info.music"] = music
    }
    t1["environment_info.cuisine_type_primary"] = {
        var array:[String] = []
        t1["categories"] => { (i, category: Transform<AnyObject>) in
            if let category = category["name"] as? String {
                array.append(category)
            }
        }
        return array.joinWithSeparator(" / ")
    }()
    
    // [OK] Parking
    t1["extended.parking"] => { (i, parking: String) in
        switch parking {
        case "garage": t1["parking.garage"] = "garage"; break
        case "lot": t1["parking.private_lot"] = "private_lot"; break
        case "street": t1["parking.street_free"] = "street_free"; break
        case "valet": t1["parking.valet"] = "valet"; break;
        case "validated": t1["parking.street_metered"] = "street_metered"; break;
        default: break
        }
    }
    
    // [OK] currencies
    var accepted_currencies: [AnyObject] = []
    if let symbol = t1["currency.symbol"] {
        accepted_currencies.append(["accepted_currency": symbol])
    }
    if accepted_currencies.count == 0 {
        accepted_currencies.append(["accepted_currency": "USD"])
    }
    t1["accepted_currencies"] = accepted_currencies
    
    // [OK] seating_locations
    var seating_locations: [AnyObject] = []
    seating_locations.append(["seating_location": "indoor"])
    if let outdoor = t1["extended.outdoor_seating"] as? Bool where outdoor == true {
        seating_locations.append(["seating_location": "outdoor"])
    }
    t1["seating_locations"] = seating_locations
    
    // [OK] operating days
    t1["operating_days"] = {
        let days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
        var array:[AnyObject] = []
        
        $.each(days) { (i, day: String) in
            let ot = Transform<AnyObject>()
            
            t1["open_hours.\(day)"] => { (j, openHour: String) in
                let time = (j == 0 ? "open_time" : "close_time")
                ot[time] = openHour
                ot["day_of_week"] = (i+1)
                ot["day"] = day.upercaseFirst()
                ot["day_short"] = day.sub(0, 3).upercaseFirst()
            }
            
            array.append(ot.result())
        }
        
        return array
    }()
    
//    // Menus
//    t1 <> "menus" => "menus" => { (i, menu) -> (Dictionary<String, AnyObject>) in
//        let t2 = KeyPathTransformer(menu)
//        t2 <> "menu_name" => "menuName"
//        t2 <> "currency_symbol" => "currencySymbol"
//
//        t2 <> "sections.subsections" => "group" => { (i, subsection) -> (Dictionary<String, AnyObject>) in
//            let t3 = KeyPathTransformer(subsection)
//            t3 <> "subsection_name" => "group_name"
//            
//            t3 <> "contents" => "menuItems" => { (i, content) -> (Dictionary<String, AnyObject>) in
//                let t4 = KeyPathTransformer(content)
//                t4 <> "name" => "menuItemName"
//                t4 <> "description" => "menuItemDescription"
//                t4 <> "price" => "menuItemPrice"
//                return t4.transform()
//            }
//            
//            return t3.transform()
//        }
//        
//        return t2.transform()
//    }
//    
//    return t1.transform()
    
    return t1.result()
}
