//
//  NSDate+Extensions.swift
//  Pods
//
//  Created by Gabriel Coman on 26/03/2016.
//
//

import UIKit

extension NSDate {
    
    /**
     Returns the date for today, formatted as yyyy-MM-dd
     - returns: returns a string as 2016-03-18
     */
    static func omfNowDate() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.stringFromDate(NSDate())
    }
}
