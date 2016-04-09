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

public class YellowPagesService: NSObject, ServiceProtocol {
    
    private static let Url: String = "http://api2.yp.com/listings/v1/search"
    private static let Key: String = "qptcklyknd"
    
    public static func search(name n: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        var query: [String] = []
        if let n = n {
            query.append("term=\(n)".urlEncode())
        }
        if let lat = lat, lng = lng {
            query.append("searchloc=\(lat),\(lng)")
        }
        if let rad = rad {
            query.append("radius=\(rad)")
        }
        query.append("key=\(Key)")
        query.append("format=json")
        query.append("sort=distance")
        query.append("listingcount=10")
        let finalUrl = Url + (query.count > 0 ? "?" + query.joinWithSeparator("&") : "")
        
        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
            
            switch response.result {
            case .Success(let JSON):
                if let JSON = JSON as? [String:AnyObject],
                   let response = JSON["searchResult"] as? [String:AnyObject],
                   let listings = response["searchListings"] as? [String: AnyObject],
                   let venues = listings["searchListing"] as? [[String:AnyObject]]
                {
                    print(listings)
                    
//                    $.each(venues) { (venue: [String:AnyObject]) in
//                        print(venue)
//                    }
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    static func details(id pid: String, callback: ([String : AnyObject]) -> Void) {
        // nothing
    }
}
