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
    
    private var dataService: DataService = DataService()
    private var qry: String = ""
    private var lat: Float = 0
    private var lng: Float = 0
    private var rad: Float = 0
    
    public override init() {
        super.init()
        dataService.serviceDelegate = self
        dataService.authDelgate = FoursquareAuth.sharedInstance
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
            "radius":rad
        ]
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
    
    func process(JSON: AnyObject) -> AnyObject {
        if  let JSON = JSON as? [String:AnyObject],
            let response = JSON["response"] as? [String: AnyObject],
            let venues = response["venues"] as? [AnyObject] as? [[String:AnyObject]] {
        
                return venues
        }
        
        return [:]
    }
    
    public func search(query qry: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        
        if let qry = qry, lat = lat, lng = lng, rad = rad {
            self.qry = qry; self.lat = lat; self.lng = lng; self.rad = rad
        }
        dataService.execute() { result in
            print(result)
        }
    }
}
