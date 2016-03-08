//
//  Locu+OpenMenu.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//
//

import UIKit
import Dollar

extension LocuRestaurant {
    
    //
    // extension function that converts a LocuRestaurant object to an OpenMenu 
    // one
    func convertToOpenMenu () -> OMenuRestaurant {
        let orestaurant = OMenuRestaurant()
        
        // standard default open menu stuff
        orestaurant.uuid = "1111"
        orestaurant.accuracy = "9"
        orestaurant.privacy = false
        orestaurant.version = "1.6.2"
        
        // try to convert restaurant info 
        orestaurant.restaurantInfo = OMenuRestaurantInfo()
        orestaurant.restaurantInfo!.restaurantName = name
        orestaurant.restaurantInfo!.fullDescription = restaurantDescription
        orestaurant.restaurantInfo!.address1 = location?.address1
        orestaurant.restaurantInfo!.address2 = location?.address2
        orestaurant.restaurantInfo!.cityTown = location?.locality
        orestaurant.restaurantInfo!.stateProvince = location?.region
        orestaurant.restaurantInfo!.postalCode = location?.postalCode
        orestaurant.restaurantInfo!.country = location?.country
        orestaurant.restaurantInfo!.phone = contact?.phone
        orestaurant.restaurantInfo!.fax = contact?.fax
        orestaurant.restaurantInfo!.longitude = location?.geo?.longitude
        orestaurant.restaurantInfo!.latitude = location?.geo?.latitude
        orestaurant.restaurantInfo!.websiteUrl = websiteURL
        
        // try environment info
        orestaurant.environmentInfo = OMenuEnvironmentInfo()
        orestaurant.environmentInfo!.cuisineTypePrimary = ""
        orestaurant.environmentInfo!.cuisineTypeSecondary = ""
        orestaurant.environmentInfo!.smokingAllowed = extended?.smoking
        orestaurant.environmentInfo!.takeoutAvailable = extended?.takeout
        orestaurant.environmentInfo!.wheelchairAccessible = extended?.wheelchairAccessible
        orestaurant.environmentInfo!.ageLevelPreference = extended?.minimumAge
        orestaurant.environmentInfo!.dressCode = extended?.attire
        orestaurant.environmentInfo!.deliveryAvailable = delivery?.willDeliver
        orestaurant.environmentInfo!.deliveryFee = delivery?.minimumOrder
        orestaurant.environmentInfo!.cateringAvailable = extended?.caters
        orestaurant.environmentInfo!.reservations = extended?.reservations
        orestaurant.environmentInfo!.alcoholType = extended?.alcohol
        orestaurant.environmentInfo!.musicType = extended?.music.first
//        let altype = $.chain(extended!.music)
//        altype.each({ ! += ($0 as String) }).value
        
        // try to convert aux data
        
        // try convert menu data
        $.each(menus) { (index, menu: LocuMenu) in
            // main menu
            let omenu = OMenuMenu()
            omenu.menuName = menu.menuName
            omenu.currencySymbol = menu.currencySymbol
            
            // menu groups
            $.each(menu.sections) { (i, section: LocuSection) in
                $.each(section.subsections) { (j, subsection: LocuSubsection) in
                    let ogroup = OMenuGroup()
                    ogroup.groupName = subsection.subsectionName
                    
                    // add the atual menu items
                    $.each(subsection.contents) { (k, sectionObject: LocuSectionObject) in
                        let menuItem = OMenuItem()
                        menuItem.menuItemName = sectionObject.name
                        menuItem.menuItemDescription = sectionObject.objectDescription
                        menuItem.menuItemPrice = sectionObject.price
                        
                        // append
                        ogroup.menuItems.append(menuItem)
                    }
                    
                    // append
                    omenu.menuGroups.append(ogroup)
                }
            }
            
            // finally append
            orestaurant.menus.append(omenu)
        }
        
        return orestaurant
    }
}
