//
//  LocuSubsection.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//  as defined in https://dev.locu.com/documentation/#menu
//

import UIKit
import ObjectMapper
import Dollar

class LocuSubsection: NSObject, Mappable {
    var subsectionName: String!
    var contents: [LocuSectionObject] = []
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        subsectionName <- map["subsection_name"]
        contents <- map["contents"]
    }
    
    func printModel(){
        print("\t\t|-- subsection: ")
        print("\t\t\t|-- subsectionName: \(subsectionName)")
        $.each(contents) { (index, content: LocuSectionObject) in
            content.printModel()
        }
    }
}
