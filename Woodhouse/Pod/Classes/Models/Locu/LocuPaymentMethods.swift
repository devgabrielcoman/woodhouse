//
//  LocuPaymentMethods.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/#extended
//

import UIKit
import ObjectMapper
import Nosce

class LocuPaymentMethods: NSObject, Mappable {
    var visa: Bool!
    var mastercard: Bool!
    var amex: Bool!
    var discover: Bool!
    var dinersclub: Bool!
    var square: Bool!
    var paypal: Bool!
    var giftcard: Bool!
    var jcb: Bool!
    var check: Bool!
    var carteblanche: Bool!
    var cash: Bool!
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        visa <- map["visa"]
        mastercard <- map["mastercard"]
        amex <- map["amex"]
        discover <- map["discover"]
        dinersclub <- map["dinersclub"]
        square <- map["square"]
        paypal <- map["paypal"]
        giftcard <- map["giftcard"]
        jcb <- map["jcb"]
        check <- map["check"]
        carteblanche <- map["carteblanche"]
        cash <- map["cash"]
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Payment:", tab: 1)
    }
}
