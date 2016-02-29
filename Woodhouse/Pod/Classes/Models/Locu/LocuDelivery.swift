//
//  LocuDelivery.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#delivery
//

import UIKit
import ObjectMapper

class LocuDelivery: NSObject, Mappable {
    var willDeliver: Bool!
    var minimumOrder: Float!
    var hours: LocuHours?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        willDeliver <- map["will_deliver"]
        minimumOrder <- map["minimum_order"]
        hours <- map["hours"]
    }
    
    func printModel() {
        print("delivery")
        print("\twillDeliver: \(willDeliver)")
        print("\tminimumOrder: \(minimumOrder)")
        hours?.printModel()
    }
}
