//
//  YellowPagesService.swift
//  Pods
//
//  Created by Gabriel Coman on 09/04/2016.
//
//

import UIKit
import Alamofire
import Dollar

public class YellowPagesSearch: NSObject, ServiceProtocol {
    
    private var qry: String = ""
    private var lat: Float = 0
    private var lng: Float = 0
    private var rad: Float = 0
    private var dataService: DataService = DataService()
    
    public override init() {
        super.init()
        dataService.serviceDelegate = self
        dataService.authDelgate = YellowPagesAuth.sharedInstance
    }
    
    func apiurl() -> String {
        return "http://api2.yp.com/listings/v1/search"
    }
    
    func detailsURL() -> String? {
        return nil
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "format":"json",
            "sort":"distance",
            "listingcount":"10",
            "term":qry.urlEncode(),
            "searchloc":"\(lat),\(lng)",
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
            let response = JSON["searchResult"] as? [String:AnyObject],
            let listings = response["searchListings"] as? [String: AnyObject],
            let venues = listings["searchListing"] as? [[String:AnyObject]] {
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
