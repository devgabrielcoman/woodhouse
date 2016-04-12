//
//  YelpService.swift
//  Pods
//
//  Created by Gabriel Coman on 04/04/2016.
//
//

import UIKit
import Alamofire

public class YelpSearch: NSObject, ServiceProtocol {
    
    private var qry: String = ""
    private var lat: Float = 0
    private var lng: Float = 0
    private var rad: Float = 0
    private var dataService: DataService = DataService()
    
    public override init() {
        super.init()
        dataService.serviceDelegate = self
        dataService.authDelgate = YelpAuth.sharedInstance
    }
    
    func apiurl() -> String {
        return "https://api.yelp.com/v2/search"
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "term":qry.urlEncode(),
            "location":"London",
            "cll":"\(lat),\(lng)"
        ]
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
    
    func process(JSON: AnyObject) -> AnyObject {
        if  let response = JSON as? [String:AnyObject],
            let venues = response["businesses"] as? [[String:AnyObject]] {
            
            return venues
        }
        
        return [:]
    }
    
    public func search(query qry: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        
        if let qry = qry, lat = lat, lng = lng, rad = rad {
            self.qry = qry; self.lat = lat; self.lng = lng; self.rad = rad
        }
        dataService.execute()
    }
}
