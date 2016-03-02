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
import Nosce

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
        Nosce.printObject(reflecting: self, alias: "Section:", tab: 1, exceptFields: ["subsections"])
        $.each(subsections) { (index, subsection: LocuSubsection) in
            subsection.printModel()
        }
    }
}
