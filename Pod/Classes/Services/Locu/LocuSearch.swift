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

public class LocuSearch: NSObject, ServiceProtocol {
    
    private var qry: String = ""
    private var lat: Float = 0
    private var lng: Float = 0
    private var rad: Float = 0
    private var dataService: DataService = DataService()
    
    public override init() {
        super.init()
        dataService.delegate = self
    }
    
    func apiurl() -> String {
        return "https://api.locu.com/v2/venue/search/"
    }
    
    func method() -> String {
        return "POST"
    }
    
    func query() -> [String : AnyObject]? {
        return nil
    }
    
    func headers() -> [String : String]? {
        return nil
    }
    
    func parameters() -> [String : AnyObject]? {
        return [
            "api_key": (LocuAuth.auth()?["api_key"])!,
            "fields": ["name", "location", "contact", "categories", "open_hours", "delivery", "extended", /*"menus"*/],
            "venue_queries":[[
                "name": qry.urlEncode(),
                "location":[
                    "geo":[
                        "$in_lat_lng_radius":[lat, lng, rad]
                    ]
                ]
                
            ]]
        ]
    }
    
    public func search(query qry: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        
        if let qry = qry, lat = lat, lng = lng, rad = rad {
            self.qry = qry; self.lat = lat; self.lng = lng; self.rad = rad
        }
        dataService.execute()
//        
//        // form the final URL
//        let finalUrl = Url
//        
//        // form the base query object - starts as empty
//        var query: [String : AnyObject] = [:]
//        
//        // the ad name
//        if let _n = n {
//            query["name"] = _n;
//        }
//        // and location
//        if let _l1 = lat, _l2 = lng, _rad = rad {
//            query["location"] = [
//                "geo": [
//                    "$in_lat_lng_radius":[_l1, _l2, _rad]
//                ]
//            ]
//        }
//        
//        // form the final parameters
//        let parameters: [String : AnyObject] = [
//            "api_key": Key,
//            "fields": Fields,
//            "venue_queries":[ query ]
//        ]
//
//        let URL = NSURL(string: finalUrl)!
//        let req = NSMutableURLRequest(URL: URL)
//        req.HTTPMethod = "POST"
//        do {
//            let data: NSData = try NSJSONSerialization.dataWithJSONObject(parameters, options: NSJSONWritingOptions.PrettyPrinted)
//            req.HTTPBody = data
//        } catch {
//            
//        }
//        
//        Alamofire.request(req).responseJSON { response in
//            switch response.result {
//            case .Success(let JSON):
//                print(JSON)
//            case .Failure(let error):
//                print("Request failed with error: \(error)")
//            }
//            
//        }
    }
}