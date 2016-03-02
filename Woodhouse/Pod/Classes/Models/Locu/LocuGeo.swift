//
//  LocuGeo.swift
//  Pods
//
//  Created by Gabriel Coman on 27/02/2016.
//  simple defintion of http://geojson.org/geojson-spec.html
//

import UIKit
import ObjectMapper
import Nosce

class LocuGeo: NSObject, Mappable {
    var type: String!
    var longitude: Float!
    var latitude: Float!
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        longitude <- map["coordinates.0"]
        latitude <- map["coordinates.1"]
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Geo:", tab: 1)
    }
}
