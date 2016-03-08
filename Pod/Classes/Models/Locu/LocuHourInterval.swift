//
//  LocuHourInterval.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/
//

import UIKit
import Nosce

class LocuHourInterval: NSObject {
    var start: String!
    var end: String!
    
    init(start _s: String, end _e: String) {
        super.init()
        start = _s
        end = _e
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Interval:", tab: 1)
    }
}
