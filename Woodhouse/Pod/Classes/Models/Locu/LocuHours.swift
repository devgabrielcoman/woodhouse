//
//  LocuOpenHours.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  as defined in https://dev.locu.com/documentation/
//

import UIKit
import ObjectMapper
import Dollar

class LocuHours: NSObject, Mappable {
    // private variables to  map to the JSON
    private var imonday: [[String]] = [[]]
    private var ituesday: [[String]] = [[]]
    private var iwednesday: [[String]] = [[]]
    private var ithursday: [[String]] = [[]]
    private var ifriday: [[String]] = [[]]
    private var isaturday: [[String]] = [[]]
    private var isunday: [[String]] = [[]]
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
        $.each(imonday) { (index, hourinterval) in
            let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
            if let interval = interval {
                self.monday.append(interval)
            }
        }
        
        $.each(ituesday) { (index, hourinterval) in
            let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
            if let interval = interval {
                self.tuesday.append(interval)
            }
        }
        $.each(iwednesday) { (index, hourinterval) in
            let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
            if let interval = interval {
                self.wednesday.append(interval)
            }
        }
        $.each(ithursday) { (index, hourinterval) in
            let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
            if let interval = interval {
                self.thursday.append(interval)
            }
        }
        $.each(ifriday) { (index, hourinterval) in
            let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
            if let interval = interval {
                self.friday.append(interval)
            }
        }
        $.each(isaturday) { (index, hourinterval) in
            let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
            if let interval = interval {
                self.saturday.append(interval)
            }
        }
        $.each(isunday) { (index, hourinterval) in
            let interval: LocuHourInterval? = self.mapInternalToExternal(hourinterval)
            if let interval = interval {
                self.sunday.append(interval)
            }
        }
    }
    
    //
    // private function that maps an internal hour interval, given as a [String]
    // array (e.g. ["12:00","19:30"] to a more manageable LocuHourInterval object
    // that contains start and end string dates
    private func mapInternalToExternal(interval: [String]) -> LocuHourInterval? {
        if interval.count >= 2 {
            let start = interval[0] as String?
            let end = interval[1] as String?
            if let start = start, end = end {
                return LocuHourInterval(start: start, end: end)
            }
        }
        return nil
    }
    
    func printModel() {
        print("openHours: ")
        
        var monOut = "\t|-- monday: "
        $.each(monday) { (index, interval) in
            monOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var tueOut = "\t|-- tuesday: "
        $.each(tuesday) { (index, interval) in
            tueOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var wedOut = "\t|-- wednesday: "
        $.each(wednesday) { (index, interval) in
            wedOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var thuOut = "\t|-- thursday: "
        $.each(thursday) { (index, interval) in
            thuOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var friOut = "\t|-- friday: "
        $.each(friday) { (index, interval) in
            friOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var satOut = "\t|-- saturday: "
        $.each(saturday) { (index, interval) in
            satOut += "\((interval as LocuHourInterval).printModel()) "
        }
        
        var sunOut = "\t|-- sunday: "
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
