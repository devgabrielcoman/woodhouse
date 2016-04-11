//
//  CityGrid.swift
//  Pods
//
//  Created by Gabriel Coman on 09/04/2016.
//
//

import UIKit
import Dollar
import Alamofire

public class CityGridSearch: NSObject, ServiceProtocol {

    private var qry: String = ""
    private var lat: Float = 0
    private var lng: Float = 0
    private var rad: Float = 0
    private var dataService: DataService = DataService()
    
    public override init() {
        super.init()
        dataService.serviceDelegate = self
        dataService.authDelgate = CityGridAuth.sharedInstance
    }
    
    func apiurl() -> String {
        return "https://api.citygridmedia.com/content/places/v2/search/latlon"
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "type":"restaurant",
            "format":"json",
            "rpp":"5",
            "what":qry.urlEncode(),
            "lat":lat,
            "lon":lng,
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
        if let JSON = JSON as? [String : AnyObject],
           let response = JSON["results"] as? [String: AnyObject],
           let venues = response["locations"] as? [[String:AnyObject]] {
        
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
