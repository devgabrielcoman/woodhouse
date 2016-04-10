//
//  GoogleService.swift
//  Pods
//
//  Created by Gabriel Coman on 06/04/2016.
//
//

import UIKit
import Alamofire
import Dollar
import PromiseKit

public class GoogleSearch: NSObject, ServiceProtocol {
    
    private let url1: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    private let url2: String = "https://maps.googleapis.com/maps/api/place/details/json"
    private let Key: String = "AIzaSyAfdp5QoHl0fwrBmUAq-dqCvPMuwLPcou8"
    
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
        return "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "key": (GoogleAuth.auth()?["key"])!,
            "name":qry.urlEncode(),
            "location":"\(lat),\(lng)",
            "radius":rad
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
//        query.append("key=\(Key)")
//        if let n = n {
//            query.append("name=\(n.urlEncode())")
//        }
//        if let lat = lat, let lng = lng {
//            query.append("location=\(lat),\(lng)")
//        }
//        if let rad = rad {
//            query.append("radius=\(rad)")
//        }
//        let finalUrl = url1 + (query.count > 0 ? "?" + query.joinWithSeparator("&") : "")
//        
//        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
//            
//            switch response.result {
//            case .Success(let JSON):
//                if let response = JSON as? [String:AnyObject],
//                   let venues = response["results"] as? [AnyObject] as? [[String:AnyObject]] {
//                    
//                    $.each(venues) { (venue: [String:AnyObject]) in
//                        if let placeId = venue["place_id"] as? String {
//                            self.details(id: placeId) { (detail: [String : AnyObject]) in
//                                print(detail)
//                            }
//                        }
//                    }
//                    
//                }
//            case .Failure(let error):
//                print("Request failed with error: \(error)")
//            }
//        }
    }
    
    func details(id pid: String, callback: ([String:AnyObject]) -> Void) {
        var query: [String] = []
        query.append("key=\(Key)")
        query.append("placeid=\(pid)")
        let finalUrl = url2 + "?" + query.joinWithSeparator("&")
        
        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
            switch response.result {
            case .Success(let JSON):
                if let detail = JSON as? [String:AnyObject],
                    let final = detail["result"] as? [String:AnyObject] {
                    callback(final)
                } else {
                    callback([:])
                }
            case .Failure(let error):
                callback([:])
            }
        }
    }
}
