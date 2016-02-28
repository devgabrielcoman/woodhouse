//
//  LocuPaymentMethods.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//
//

import UIKit
import ObjectMapper

class LocuPaymentMethods: NSObject, Mappable {
    var visa: Bool?
    var mastercard: Bool?
    var amex: Bool?
    var discover: Bool?
    var dinersclub: Bool?
    var square: Bool?
    var paypal: Bool?
    var giftcard: Bool?
    var jcb: Bool?
    var check: Bool?
    var carteblanche: Bool?
    var cash: Bool?
    
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
        var payStr = "\tpayment: "
        if let item = visa {
            payStr += (item == true ? "visa ": "")
        }
        if let item = mastercard {
            payStr += (item == true ? "mastercard ": "")
        }
        if let item = amex {
            payStr += (item == true ? "amex ": "")
        }
        if let item = discover {
            payStr += (item == true ? "discover ": "")
        }
        if let item = dinersclub {
            payStr += (item == true ? "dinersclub ": "")
        }
        if let item = square {
            payStr += (item == true ? "square ": "")
        }
        if let item = paypal {
            payStr += (item == true ? "paypal ": "")
        }
        if let item = giftcard {
            payStr += (item == true ? "giftcard ": "")
        }
        if let item = jcb {
            payStr += (item == true ? "jcb ": "")
        }
        if let item = check {
            payStr += (item == true ? "check ": "")
        }
        if let item = carteblanche {
            payStr += (item == true ? "carteblanche ": "")
        }
        if let item = cash {
            payStr += (item == true ? "cash ": "")
        }
        print(payStr)
    }
}
