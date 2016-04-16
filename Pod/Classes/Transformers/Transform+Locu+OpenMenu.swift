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
    let t = Transform<AnyObject>(locu)
    
    // [OK] metadata
    t["uuid"] = String.createOmfUUID()
    t["accuracy"] = 1
    t["created_date"] = NSDate.omfNowDate()
    t["open_menu.version"] = "1.6"
    
    // [OK] restaurant info
    // details subset
    t["restaurant_info.restaurant_name"] = t["name"]
    t["restaurant_info.brief_description"] = t["description"]
    t["restaurant_info.business_type"] = "independent"
    
    // location subset
    t["restaurant_info.address_1"] = t["location.address1"]
    t["restaurant_info.city_town"] = t["location.locality"]
    t["restaurant_info.country"] = t["location.country"]
    t["restaurant_info.postal_code"] = t["location.postal_code"]
    t["location.geo.coordinates"] => { (i, coord: Double) in
        if i == 0 { t["restaurant_info.longitude"] = coord }
        if i == 1 { t["restaurant_info.latitude"] = coord }
    }

    // contact subset
    t["restaurant_info.phone"] = t["contact.phone"]
    t["restaurant_info.website_url"] = t["website_url"]
    t["restaurant_info.omf_file_url"] = "http://sa-test-moat.herokuapp.com/static/sample.xml"
    
    // [OK] Environment
    // cuisine_type_primary subset
    var fname: [String] = []
    t["categories.name"] => { (i, name: String) in
        fname.append(name)
    }
    t["restaurant_info.environment.cuisine_type_primary"] = fname.joinWithSeparator(" / ")
    
    // seating_locations subset
    var seating_locations: [String] = ["indoor"]
    if let outdoor = t["extended.outdoor_seating"] as? Bool where outdoor == true {
        seating_locations.append("outdoor")
    }
    t["restaurant_info.environment.seating_locations"] = seating_locations
    
    // accepted_currencies subset
    var accepted_currencies: [String] = []
    if let symbol = t["currency.symbol"] as? String {
        accepted_currencies.append(symbol)
    }
    if accepted_currencies.count == 0 {
        accepted_currencies.append("USD")
    }
    t["restaurant_info.environment.accepted_currencies"] = accepted_currencies

    // operating days subset
    t["operating_days"] = {
        let days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
        var array:[AnyObject] = []
        
        $.each(days) { (i, day: String) in
            let ot = Transform<AnyObject>()
            
            t["open_hours.\(day)"] => { (j, openHour: String) in
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
    
    return t.result()
}
