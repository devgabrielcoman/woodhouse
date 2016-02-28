//
//  LocuOpenHours.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//
//

import UIKit
import ObjectMapper
import Dollar

class LocuHours: NSObject, Mappable {
    // private variables to  map to the JSON
    private var imonday: [[String]]?
    private var ituesday: [[String]]?
    private var iwednesday: [[String]]?
    private var ithursday: [[String]]?
    private var ifriday: [[String]]?
    private var isaturday: [[String]]?
    private var isunday: [[String]]?
    // public vars that are better to access for 3rd parties
    var monday: [LocuHourInterval] = []
    var tuesday: [LocuHourInterval] = []
    var wednesday: [LocuHourInterval] = []
    var thursday: [LocuHourInterval] = []
    var friday: [LocuHourInterval] = []
    var saturday: [LocuHourInterval] = []
    var sunday: [LocuHourInterval] = []
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        // get direct mapping through ObjectMapper and into the private brute variables
        imonday <- map["monday"]
        ituesday <- map["tuesday"]
        iwednesday <- map["wednesday"]
        ithursday <- map["thursday"]
        ifriday <- map["friday"]
        isaturday <- map["saturday"]
        isunday <- map["sunday"]
        
        // now do some more parsings
        if let imo = imonday {
            $.each(imo) { (index, hourinterval) in
                let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
                if let i = interval {
                    self.monday.append(i)
                }
            }
        }
        
        if let itu = ituesday {
            $.each(itu) { (index, hourinterval) in
                let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
                if let i = interval {
                    self.tuesday.append(i)
                }
            }
        }
        if let itu = iwednesday {
            $.each(itu) { (index, hourinterval) in
                let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
                if let i = interval {
                    self.wednesday.append(i)
                }
            }
        }
        if let itu = ithursday {
            $.each(itu) { (index, hourinterval) in
                let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
                if let i = interval {
                    self.thursday.append(i)
                }
            }
        }
        if let itu = ifriday {
            $.each(itu) { (index, hourinterval) in
                let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
                if let i = interval {
                    self.friday.append(i)
                }
            }
        }
        if let itu = isaturday {
            $.each(itu) { (index, hourinterval) in
                let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
                if let i = interval {
                    self.saturday.append(i)
                }
            }
        }
        if let itu = isunday {
            $.each(itu) { (index, hourinterval) in
                let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
                if let i = interval {
                    self.sunday.append(i)
                }
            }
        }
    }
    
    //
    // private function that maps an internal hour interval, given as a [String]
    // array (e.g. ["12:00","19:30"] to a more manageable LocuHourInterval object
    // that contains start and end string dates
    private func mapInternalToExternal(interval: [String]) -> LocuHourInterval? {
        let start = (interval as [String]).first as String?
        let end = (interval as [String])[1] as String?
        if let s = start, e = end {
            return LocuHourInterval(start: s, end: e)
        }
        return nil
    }
    
    func printModel() {
        print("openHours: ")
        
        var monOut = "\tmonday: "
        $.each(monday) { (index, interval) in
            monOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var tueOut = "\ttuesday: "
        $.each(tuesday) { (index, interval) in
            tueOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var wedOut = "\twednesday: "
        $.each(wednesday) { (index, interval) in
            wedOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var thuOut = "\tthursday: "
        $.each(thursday) { (index, interval) in
            thuOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var friOut = "\tfriday: "
        $.each(friday) { (index, interval) in
            friOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var satOut = "\tsaturday: "
        $.each(saturday) { (index, interval) in
            satOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var sunOut = "\tsunday: "
        $.each(sunday) { (index, interval) in
            sunOut += "\((interval as LocuHourInterval).printModel()) "
        }
        print(monOut)
        print(tueOut)
        print(wedOut)
        print(thuOut)
        print(friOut)
        print(satOut)
        print(sunOut)
    }
}
