//
//  LocuService.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//
//

import UIKit
import Alamofire
import Dollar
import KeyPathTransformer

public class LocuService: NSObject, ServiceProtocol {
    
    // constants for Locu
    private static let Key: String = "a246184db3876f5e20ffdbeea74188e79670c49d"
    private static let Url: String = "https://api.locu.com/v2/venue/search/"
    private static let Fields: [String] = ["name", "location", "contact", "categories", "open_hours", "delivery", "extended", /*"menus"*/]
    
    /**
     Function that executes a basic search through Locu API for a location 
     based on given parameters
     
     - parameter n:   the Name of the restaurant
     - parameter lat: latitude as float
     - parameter lng: longitude as float
     - parameter rad: the radius in meters
     */
    public static func search(name n: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        // form the final URL
        let finalUrl = Url
        
        // form the base query object - starts as empty
        var query: [String : AnyObject] = [:]
        
        // the ad name
        if let _n = n {
            query["name"] = _n;
        }
        // and location
        if let _l1 = lat, _l2 = lng, _rad = rad {
            query["location"] = [
                "geo": [
                    "$in_lat_lng_radius":[_l1, _l2, _rad]
                ]
            ]
        }
        
        // form the final parameters
        let parameters: [String : AnyObject] = [
            "api_key": Key,
            "fields": Fields,
            "venue_queries":[ query ]
        ]
        
        Alamofire.request(.POST, finalUrl, parameters: parameters, encoding: .JSON).responseJSON { response in
            
            switch response.result {
            case .Success(let JSON):
                if let response = JSON as? [String:AnyObject],
                   let venues = response["venues"] as? [AnyObject] as? [[String:AnyObject]] {
                    
                    $.each(venues) { (venue: [String:AnyObject]) in
                        print(venue)
                        print("##############################")
                        print(mapLocuToOMenu(venue))
                    }
                    
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    static func details(id pid: String, callback: ([String : AnyObject]) -> Void) {
        // nothing
    }
}