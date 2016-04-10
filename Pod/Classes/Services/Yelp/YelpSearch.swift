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
    
    private let Url: String = "https://api.yelp.com/v2/search"
    private let ConsumerKey: String = "KYwum5JY_tOVvObefPzF5A"
    private let ConsumerSecret: String = "YqJtzEpgBgoSLNT2EO5CjbMVGQc"
    private let Token: String = "87uB8dcVpGTVexi6d1vT0A-e--bwpgEn"
    private let TokenSecrent: String = "19sDBGvmr2fIO2BEDGpRtGB1Rm8"
    
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
        return "https://api.yelp.com/v2/search"
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "term":qry.urlEncode(),
            "location":"London",
            "cll":"\(lat),\(lng)",
            "oauth_signature_method":"HMAC-SHA1",
            "oauth_timestamp":(NSInteger)(NSDate().timeIntervalSince1970),
            "oauth_nonce":String.createUUID(6),
            "oauth_version":"1.0",
            "oauth_signature":"QBmGFvymKq2ye5g0MTKYhyWEt+o="
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
        
//        var nonce: String = String.createUUID(6)
//        let timeInterval = (NSInteger)(NSDate().timeIntervalSince1970)
//        
//        let finalUrl = "https://api.yelp.com/v2/search?term=kazan&location=London&cll=51.500152,-0.126236&oauth_consumer_key=KYwum5JY_tOVvObefPzF5A&oauth_token=87uB8dcVpGTVexi6d1vT0A-e--bwpgEn&oauth_signature_method=HMAC-SHA1&oauth_timestamp=\(timeInterval)&oauth_nonce=\(nonce)&oauth_version=1.0&oauth_signature=QBmGFvymKq2ye5g0MTKYhyWEt+o="
//        print(finalUrl)
//        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
//            print(response)
//        }
        
    }
    
    func details(id pid: String, callback: ([String : AnyObject]) -> Void) {
        // nothing
    }
}
