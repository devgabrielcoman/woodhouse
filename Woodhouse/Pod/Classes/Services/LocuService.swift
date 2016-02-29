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
import ObjectMapper
import AlamofireObjectMapper

public class LocuService: NSObject, ServiceProtocol {
    
    // constants for Locu
    private static let Key: String = "a246184db3876f5e20ffdbeea74188e79670c49d"
    private static let Url: String = "https://api.locu.com/v2/venue/search/"
    private static let Radius: Int = 300
    private static let Fields: [String] = ["name", "location", "contact", "categories", "open_hours", "delivery", "extended", "menus"]
    
    //
    // function that takes three basic search parameters and peforms a search
    // @param: name
    // @param: latitude
    // @param: longitude
    public static func searchNameGeo(name n: String?, latitude lat: Float?, longitude lng: Float?) {
        // form the base query object - starts as empty
        var query: [String : AnyObject] = [:]
        
        // the ad name
        if let _n = n {
            query["name"] = _n;
        }
        // and location
        if let _l1 = lat, _l2 = lng {
            query["location"] = [
                "geo": [
                    "$in_lat_lng_radius":[_l1, _l2, Radius]
                ]
            ]
        }
        
        // form the final parameters
        let parameters: [String : AnyObject] = [
            "api_key": Key,
            "fields": Fields,
            "venue_queries":[ query ]
        ]
        
        // and make the request
        Alamofire.request(.POST, Url, parameters: parameters, encoding: .JSON).responseArray("venues") { (response: Response<[LocuRestaurant], NSError>) -> Void in
            if let locu = response.result.value {
                $.each(locu) { (index, elem: LocuRestaurant) in
                    elem.printModel()
                    let omf: OMenuRestaurant = elem.convertToOpenMenu()
                    omf.printModel()
                }
            }
        }
    }
    
    //
    // simplified functions derived from most generic search
    public static func searchName(name n: String) {
        searchNameGeo(name: n, latitude: nil, longitude: nil)
    }
    
    //
    // simplified functions derived from most generic search
    public static func searchGeo(latitude lat: Float, longitude lng: Float) {
        searchNameGeo(name: nil, latitude: lat, longitude: lng)
    }
}