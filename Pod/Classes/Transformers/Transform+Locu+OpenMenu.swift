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

func mapLocuToOMenu(locu: Dictionary<String, AnyObject>) -> Dictionary<String, AnyObject>{
    
    // [OK] start transformer
    let t1 = KeyPathTransformer(locu)
    
    let woodhouse_id = String.createUUID(32)
    t1 +> woodhouse_id => "woodhouse_id"
    
    // [OK] Omf metadata
    t1 +> String.createOmfUUID() => "omf_uuid"
    t1 +> 1 => "omf_accuracy"
    t1 +> false => "omf_private"
    t1 +> "1.6.2" => "omf_version"
    t1 +> NSDate.omfNowDate() => "omf_updated_timestamp"
    t1 +> false => "force_ads"
    
    // [OK] Restaurant info
    t1 <> "name" => "restaurant_info.restaurant_name"
    t1 <> "description" => "restaurant_info.brief_description"
    t1 <> "description" => "restaurant_info.full_description"
    t1 <> "location.address1" => "restaurant_info.address_1"
    t1 <> "location.address2" => "restaurant_info.address_2"
    t1 <> "location.locality" => "restaurant_info.city_town"
    t1 <> "location.region" => "restaurant_info.state_province"
    t1 <> "location.postal_vode" => "restaurant_info.postal_code"
    t1 <> "location.country" => "restaurant_info.country"
    t1 <> "contact.phone" => "restaurant_info.phone"
    t1 <> "contact.fax" => "restaurant_info.fax"
    t1 <> "location.geo.longitude" => "restaurant_info.longitude"
    t1 <> "location.geo.latitude" => "restaurant_info.latitude"
    t1 <> "website_url" => "restaurant_info.website_url"
    t1 +> "independent" => "restaurant_info.business_type"
    t1 +> String.createUUID(25) => "restaurant_info.location_id"
    t1 +> false => "restaurant_info.mobile"
    t1 +> "https://woodhouse.com/\(woodhouse_id)" => "omf_file_url"
    
    // [OK] Environment info
    t1 +> 0 => "environment_info.seating_qty"
    t1 <> "extended.smoking" => "environment_info.smoking_allowed"
    t1 +> 0 => "environment_info.max_group_size"
    t1 +> false => "environment_info.pets_allowed"
    t1 <> "extended.minimum_age" => "environment_info.age_level_preference"
    t1 <> "extended.attire" => "environment_info.dress_code"
    t1 <> "extended.takeout" => "environment_info.takeout_available"
    t1 <> "delivery.will_deliver" => "environment_info.delivery_available"
    t1 <> "delivery.minimum_order" => "environment_info.delivery_fee"
    t1 <> "extended.caters" => "environment_info.catering_available"
    t1 <> "extended.wheelchair_accessible" => "environment_info.wheelchair_accessible"
    t1 <> "extended.reservations" => "environment_info.reservations"
    t1 <> "extended.alcohol" => "environment_info.alcohol_type"
    // music
    t1 <> "extended.music" => {(i, music) in
        t1 +> music => "environment_info.music_type"
    }
    // cuisine
    var cuisine_type_primary = Array<String>()
    t1 <> "categories" => { (i, category) in
        if let category = category as? Dictionary<String, AnyObject> {
            cuisine_type_primary.append(category <- "name" as! String)
        }
    }
    t1 +> cuisine_type_primary.joinWithSeparator(" / ") => "cuisine_type_primary"
    
    // [OK] Paring
    t1 <> "extended.parking" => {(i, parking) in
        if let parking = parking as? String {
            switch parking {
            case "garage": t1 +> "garage" => "parking.garage"; break
            case "lot": t1 +> "private_lot" => "parking.private_lot"; break;
            case "street": t1 +> "street_free" => "parking.street_free"; break;
            case "valet": t1 +> "valet" => "parking.valet"; break;
            case "validated": t1 +> "street_metered" => "parking.street_metered"; break;
            default: t1 +> "none" => "parking"; break
            }
        }
    }

    // [OK] accepted currencies
    var accepted_currencies: [AnyObject] = []
    if let symbol = locu <- "currency.symbol" {
     accepted_currencies.append(["accepted_currency":symbol])
    }
    if accepted_currencies.count == 0 {
        accepted_currencies.append(["accepted_currency":"USD"])
    }
    t1 +> accepted_currencies => "accepted_currencies"
    
    // [OK] seating_locations
    var seating_locations: [AnyObject] = []
    seating_locations.append(["seating_location":"indoor"])
    if let outdoor = locu <- "extended.outdoor_seating" as? Bool where outdoor == true {
        seating_locations.append(["seating_location":"outdoor"])
    }
    t1 +> seating_locations => "seating_locations"
    
    // [OK] Operating days
    let days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    var operating_days: [AnyObject] = []
    
    $.each(days) { (i, day: String) -> () in
        let ot = KeyPathTransformer<AnyObject>()
        let upday = day.upercaseFirst() as String
        let first3 = day.sub(0, 3).upercaseFirst() as String
        
        t1 <> "open_hours.\(day)" => { (i, day)  in
            ot +> day => (i == 0 ? "open_time" : "close_time" )
            ot +> 1 => "day_of_week"
            ot +> upday => "day"
            ot +> first3 => "day_short"
        }
        
        operating_days.append(ot.transform())
    }
    
    t1 +> operating_days => "operating_days"
    
    // Menus
    t1 <> "menus" => "menus" => { (i, menu) -> (Dictionary<String, AnyObject>) in
        let t2 = KeyPathTransformer(menu)
        t2 <> "menu_name" => "menuName"
        t2 <> "currency_symbol" => "currencySymbol"

        t2 <> "sections.subsections" => "group" => { (i, subsection) -> (Dictionary<String, AnyObject>) in
            let t3 = KeyPathTransformer(subsection)
            t3 <> "subsection_name" => "group_name"
            
            t3 <> "contents" => "menuItems" => { (i, content) -> (Dictionary<String, AnyObject>) in
                let t4 = KeyPathTransformer(content)
                t4 <> "name" => "menuItemName"
                t4 <> "description" => "menuItemDescription"
                t4 <> "price" => "menuItemPrice"
                return t4.transform()
            }
            
            return t3.transform()
        }
        
        return t2.transform()
    }
    
    return t1.transform()
}
