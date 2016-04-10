//
//  FoursquareService.swift
//  Pods
//
//  Created by Gabriel Coman on 03/04/2016.
//
//

import UIKit
import Alamofire
import Dollar
import KeyPathTransformer

public class FoursquareSearch: NSObject, ServiceProtocol {
    
    private let Url: String = "https://api.foursquare.com/v2/venues/search"
    private let ClientId: String = "OXL4H4WB5BUFGAGTWFBX2FIEB3QNG1OCQCBMZQLOV3G1YTUJ"
    private let ClientSecret: String = "W2YVIMKADZD54GZRZGPXDWM4515GP2GC5JCZUVGRTLBWPM33"
    private let Version: String = "20130815"
    
    private var dataService: DataService = DataService()
    private var qry: String = ""
    private var lat: Float = 0
    private var lng: Float = 0
    private var rad: Float = 0
    
    public override init() {
        super.init()
        dataService.delegate = self
    }
    
    func apiurl() -> String {
        return "https://api.foursquare.com/v2/venues/search"
    }
    
    func detailsURL() -> String? {
        return nil
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "query":qry.urlEncode(),
            "ll":"\(lat),\(lng)",
            "radius":rad,
            "client_id": (FoursquareAuth.auth()?["client_id"])!,
            "client_secret": (FoursquareAuth.auth()?["client_secret"])!,
            "v": (FoursquareAuth.auth()?["v"])!
        ]
    }
    
    func headers() -> [String : String]? {
        return nil
    }
    
    func parameters() -> [String : AnyObject]? {
        return nil
    }
    
    /**
     Function that executes a basic search through Zomato API for a location
     based on given parameters
     
     - parameter n:   the Name of the restaurant
     - parameter lat: latitude as float
     - parameter lng: longitude as float
     - parameter rad: the radius in meters
     */
    public func search(query qry: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        
        if let qry = qry, lat = lat, lng = lng, rad = rad {
            self.qry = qry; self.lat = lat; self.lng = lng; self.rad = rad
        }
        dataService.execute()
        
//        var query: [String] = []
//        query.append("client_id=\(ClientId)")
//        query.append("client_secret=\(ClientSecret)")
//        query.append("v=\(Version)")
//        if let n = n {
//            query.append("query=\(n.urlEncode())")
//        }
//        if let lat = lat, let lng = lng {
//            query.append("ll=\(lat),\(lng)")
//        }
//        if let rad = rad {
//            query.append("radius=\(rad)")
//        }
//        let finalUrl = Url + (query.count > 0 ? "?" + query.joinWithSeparator("&") : "")
//        
//        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
//            
//            switch response.result {
//            case .Success(let JSON):
//                if let JSON = JSON as? [String:AnyObject],
//                   let response = JSON["response"] as? [String: AnyObject],
//                   let venues = response["venues"] as? [AnyObject] as? [[String:AnyObject]] {
//                    
//                    $.each(venues) { (venue: [String:AnyObject]) in
//                        print(venue)
//                        print("><><><><><><><><><><><><><")
//                        print(mapFoursquareToOMenu(venue))
//                        print("##########################")
//                    }
//                    
//                }
//            case .Failure(let error):
//                print("Request failed with error: \(error)")
//            }
//        }
    }
    
    internal func details(id pid: String, callback: ([String:AnyObject]) -> Void) {
        // do nothing
    }
}
