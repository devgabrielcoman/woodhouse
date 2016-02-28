//
//  LocuSection.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//
//

import UIKit
import ObjectMapper
import Dollar

class LocuSection: NSObject, Mappable {
    var sectionName: String?
    var subsections: [LocuSubsection]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        sectionName <- map["section_name"]
        subsections <- map["subsections"]
    }
    
    func printModel() {
        if let sn = sectionName {
            print("\t\tsectionName: \(sn)")
        }
        if let ss = subsections {
            print("\t\tsubsections [\(ss.count)]")
            $.each(ss) { (index, subsection) in
                (subsection as LocuSubsection).printModel()
            }
        }
    }
}
