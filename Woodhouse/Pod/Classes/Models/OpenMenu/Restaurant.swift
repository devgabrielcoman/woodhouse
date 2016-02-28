//
//  Restaurant.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//  as defined in http://openmenu.org/openmenu-format.php
//

import UIKit

import ObjectMapper

class Restaurant: NSObject, Mappable {
    var omf_uuid: String?
    var omf_accuracy: String?
    var privacy: String?
    var omf_version: String?
    var omf_updated_timestamp: Int32?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        omf_uuid <- map["omf_uuid"]
        omf_accuracy <- map["omf_accuracy"]
        privacy <- map["privacy"]
        omf_version <- map["omf_version"]
        omf_updated_timestamp <- map["omf_updated_timestamp"]
    }
}
