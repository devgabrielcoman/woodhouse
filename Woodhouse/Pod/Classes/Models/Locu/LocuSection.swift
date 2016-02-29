//
//  LocuSection.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//  as defined in https://dev.locu.com/documentation/#menu
//

import UIKit
import ObjectMapper
import Dollar

class LocuSection: NSObject, Mappable {
    var sectionName: String!
    var subsections: [LocuSubsection] = []
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        sectionName <- map["section_name"]
        subsections <- map["subsections"]
    }
    
    func printModel() {
        print("\t|-- section: ")
        print("\t\t|-- sectionName: \(sectionName)")
        $.each(subsections) { (index, subsection: LocuSubsection) in
            subsection.printModel()
        }
    }
}
