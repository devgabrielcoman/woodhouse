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
    
    private var qry: String = ""
    private var lat: Float = 0
    private var lng: Float = 0
    private var rad: Float = 0
    private var dataService: DataService = DataService()
    
    public override init() {
        super.init()
        dataService.serviceDelegate = self
        dataService.authDelgate = ZomatoAuth.sharedInstance
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
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
    
    func process(JSON: AnyObject) -> AnyObject {
        if  let response = JSON as? [String:AnyObject],
            let venues = response["restaurants"] as? [AnyObject] as? [[String:AnyObject]] {
            
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
