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
        return [:]
    }
    
    public func search(query qry: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        
        if let qry = qry, lat = lat, lng = lng, rad = rad {
            self.qry = qry; self.lat = lat; self.lng = lng; self.rad = rad
        }
        dataService.execute()
        
//        var nonce: String = String.createUUID(6)
//        let timeInterval = (NSInteger)(NSDate().timeIntervalSince1970)
//        
//        let finalUrl = "https://api.yelp.com/v2/search?term=kazan&location=London&cll=51.500152,-0.126236&oauth_consumer_key=KYwum5JY_tOVvObefPzF5A&oauth_token=87uB8dcVpGTVexi6d1vT0A-e--bwpgEn&oauth_signature_method=HMAC-SHA1&oauth_timestamp=\(timeInterval)&oauth_nonce=\(nonce)&oauth_version=1.0&oauth_signature=QBmGFvymKq2ye5g0MTKYhyWEt+o="
//        print(finalUrl)
//        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
//            print(response)
//        }
        
    }
}
