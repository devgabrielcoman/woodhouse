//
//  OMenuItem.swift
//  Pods
//
//  Created by Liviu Coman on 02/03/16.
//
//

import UIKit
import Nosce

class OMenuItem: NSObject {
    var menuItemName: String!
    var menuItemDescription: String!
    var menuItemPrice: String!
    var menuItemCalories: String!
    var menuItemHeatIndex: String!
    var menuItemAllergyInformation: String!
    var menuItemAllergyInformationAllergens: String!
    var itemUid: String!
    var disabled: Bool!
    var special: Bool!
    var vegetarian: Bool!
    var vegan: Bool!
    var kosher: Bool!
    var halal: Bool!
    var glutenFree: Bool!
    
    override init() {
        super.init()
    }
    
    func printModel(){
        Nosce.printObject(reflecting: self, alias: "Menu Item:", tab: 2)
    }
}
