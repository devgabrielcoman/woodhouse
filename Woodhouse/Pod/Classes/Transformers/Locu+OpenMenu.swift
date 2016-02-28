//
//  Locu+OpenMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//
//

import UIKit

extension LocuRestaurant {
    
    //
    // extension function that converts a LocuRestaurant object to an OpenMenu 
    // one
    func convertToOpenMenu () -> OMenuRestaurant {
        let omenu = OMenuRestaurant()
        
        // standard default open menu stuff
        omenu.uuid = "1111"
        omenu.accuracy = "9"
        omenu.privacy = false
        omenu.version = "1.6.2"
        
        // try to convert restaurant info 
        omenu.restaurantInfo = OMenuRestaurantInfo()
        omenu.restaurantInfo!.restaurantName = name
        omenu.restaurantInfo!.fullDescription = description
        omenu.restaurantInfo!.address1 = location!.address1
        omenu.restaurantInfo!.address2 = location!.address2
        
        return omenu
    }
}
