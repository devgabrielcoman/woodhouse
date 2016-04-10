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
        dataService.delegate = self
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
            "key": (YellowPagesAuth.auth()?["key"])!,
            "term":qry.urlEncode(),
            "searchloc":"\(lat),\(lng)",
            "radius":rad
        ]
    }
    
    func headers() -> [String : String]? {
        return nil
    }
    
    func parameters() -> [String : AnyObject]? {
        return nil
    }
    
    public func search(query qry: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        if let qry = qry, lat = lat, lng = lng, rad = rad {
            self.qry = qry; self.lat = lat; self.lng = lng; self.rad = rad
        }
        dataService.execute()
        
//        var query: [String] = []
//        if let n = n {
//            query.append("term=\(n)".urlEncode())
//        }
//        if let lat = lat, lng = lng {
//            query.append("searchloc=\(lat),\(lng)")
//        }
//        if let rad = rad {
//            query.append("radius=\(rad)")
//        }
//        query.append("key=\(Key)")
//        query.append("format=json")
//        query.append("sort=distance")
//        query.append("listingcount=10")
//        let finalUrl = Url + (query.count > 0 ? "?" + query.joinWithSeparator("&") : "")
//        
//        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
//            
//            switch response.result {
//            case .Success(let JSON):
//                if let JSON = JSON as? [String:AnyObject],
//                   let response = JSON["searchResult"] as? [String:AnyObject],
//                   let listings = response["searchListings"] as? [String: AnyObject],
//                   let venues = listings["searchListing"] as? [[String:AnyObject]]
//                {
//                    print(listings)
//                    
////                    $.each(venues) { (venue: [String:AnyObject]) in
////                        print(venue)
////                    }
//                }
//            case .Failure(let error):
//                print("Request failed with error: \(error)")
//            }
//        }
    }
}
