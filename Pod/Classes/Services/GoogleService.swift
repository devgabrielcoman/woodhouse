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

public class GoogleService: NSObject, ServiceProtocol {
    
    private static let searchUrl: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    private static let detailsUrl: String = "https://maps.googleapis.com/maps/api/place/details/json"
    private static let Key: String = "AIzaSyAfdp5QoHl0fwrBmUAq-dqCvPMuwLPcou8"
    
    /**
     Function that executes a basic search through Zomato API for a location
     based on given parameters
     
     - parameter n:   the Name of the restaurant
     - parameter lat: latitude as float
     - parameter lng: longitude as float
     - parameter rad: the radius in meters
     */
    public static func search(name n: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        var query: [String] = []
        query.append("key=\(Key)")
        if let n = n {
            query.append("name=\(n.urlEncode())")
        }
        if let lat = lat, let lng = lng {
            query.append("location=\(lat),\(lng)")
        }
        if let rad = rad {
            query.append("radius=\(rad)")
        }
        let finalUrl = searchUrl + (query.count > 0 ? "?" + query.joinWithSeparator("&") : "")
        
        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
            
            switch response.result {
            case .Success(let JSON):
                if let response = JSON as? [String:AnyObject],
                   let venues = response["results"] as? [AnyObject] as? [[String:AnyObject]] {
                    
                    $.each(venues) { (venue: [String:AnyObject]) in
                        if let placeId = venue["place_id"] as? String {
                            details(id: placeId) { (detail: [String : AnyObject]) in
                                print(detail)
                            }
                        }
                    }
                    
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    static func details(id pid: String, callback: ([String:AnyObject]) -> Void) {
        var query: [String] = []
        query.append("key=\(Key)")
        query.append("placeid=\(pid)")
        let finalUrl = detailsUrl + "?" + query.joinWithSeparator("&")
        
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
