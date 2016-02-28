//
//  LocuSubsection.swift
//  Pods
//
//  Created by Gabriel Coman on 28/02/2016.
//
//

import UIKit
import ObjectMapper
import Dollar

class LocuSubsection: NSObject, Mappable {
    var subsectionName: String?
    var contents: [LocuSectionObject]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        subsectionName <- map["subsection_name"]
        contents <- map["contents"]
    }
    
    func printModel(){
        if let ssn = subsectionName {
            print("\t\t\tsubsectionName: \(ssn)")
        }
        if let cont = contents {
            print("\t\t\tcontents [\(cont.count)]")
            $.each(cont) { (index, content) in
                (content as LocuSectionObject).printModel()
            }
        }
    }
}
