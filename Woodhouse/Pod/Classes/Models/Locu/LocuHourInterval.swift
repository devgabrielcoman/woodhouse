//
//  LocuHourInterval.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//
//

import UIKit

class LocuHourInterval: NSObject {
    var start: String?
    var end: String?
    
    init(start _s: String, end _e: String) {
        super.init()
        start = _s
        end = _e
    }
    
    func printModel() -> String {
        if let s = start, e = end {
            return ("\(s) - \(e)")
        }
        return ""
    }
}
