//
//  OMenuEnvironmentInfo.swift
//  Pods
//
//  Created by Liviu Coman on 02/03/16.
//
//

import UIKit
import Nosce

class OMenuEnvironmentInfo: NSObject {
    var cuisineTypePrimary: String!
    var cuisineTypeSecondary: String!
    var smokingAllowed: Bool!
    var takeoutAvailable: Bool!
    var seatingQty: Int!
    var maxGroupSize: Int!
    var petsAllowed: Int!
    var wheelchairAccessible: Bool!
    var ageLevelPreference: Int!
    var dressCode: String!
    var deliveryAvailable: Bool!
    var deliveryRadius: String!
    var deliveryFee: String!
    var cateringAvailable: Bool!
    var reservations: Bool!
    var alcoholType: String!
    var musicType: String!
    
    override init() {
        super.init()
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Environment Info:")
    }
}
