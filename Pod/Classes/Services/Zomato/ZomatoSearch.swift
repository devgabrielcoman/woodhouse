//
//  ZomatoService.swift
//  Pods
//
//  Created by Gabriel Coman on 28/03/2016.
//
//

import UIKit
import Alamofire
import Dollar
import KeyPathTransformer

public class ZomatoSearch: NSObject, ServiceProtocol {
    
    private let Key: String = "f69ef3e17a2826849fcd6e9398a9ba84"
    private let Url: String = "https://developers.zomato.com/api/v2.1/search"
    
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
        return "https://developers.zomato.com/api/v2.1/search"
    }
    
    func detailsURL() -> String? {
        return nil
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "q":qry.urlEncode(),
            "lat":lat,
            "lon":lng,
            "radius":rad
        ]
    }
    
    func headers() -> [String : String]? {
        return [
            "user_key":(ZomatoAuth.auth()?["user_key"])!
        ]
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
//        
//        var query: [String] = []
//        if let n = n {
//            query.append("q=\(n)".urlEncode())
//        }
//        if let lat = lat {
//            query.append("lat=\(lat)")
//        }
//        if let lng = lng {
//            query.append("lon=\(lng)")
//        }
//        if let rad = rad {
//            query.append("radius=\(rad)")
//        }
//        let finalUrl = Url + (query.count > 0 ? "?" + query.joinWithSeparator("&") : "")
//        
//        // form the final parameters
//        let parameters: [String : AnyObject] = [
//            "user_key": Key
//        ]
//        
//        let URL = NSURL(string: finalUrl)!
//        let req = NSMutableURLRequest(URL: URL)
//        req.HTTPMethod = "GET"
//        req.setValue(Key, forHTTPHeaderField: "user_key")
//        Alamofire.request(req).responseJSON { response in
//            switch response.result {
//            case .Success(let JSON):
//                if let response = JSON as? [String:AnyObject],
//                   let venues = response["restaurants"] as? [AnyObject] as? [[String:AnyObject]] {
//                    
//                    $.each(venues) { (venue: [String:AnyObject]) in
//                        print(venue)
//                        print("##############")
//                        print(mapZomatoToOMenu(venue))
//                    }
//                
//                }
//            case .Failure(let error):
//                print("Request failed with error: \(error)")
//            }
//            
//        }
    }
    
    func details(id pid: String, callback: ([String : AnyObject]) -> Void) {
        // nothing
    }
}
