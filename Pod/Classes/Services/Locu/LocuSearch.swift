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
        dataService.serviceDelegate = self
        dataService.authDelgate = LocuAuth.sharedInstance
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
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return [
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
    
    func process(JSON: AnyObject) -> AnyObject {
        if  let JSON = JSON as? [String:AnyObject],
            let venues = JSON["venues"] {
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