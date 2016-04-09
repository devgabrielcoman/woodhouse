//
//  YelpService.swift
//  Pods
//
//  Created by Gabriel Coman on 04/04/2016.
//
//

import UIKit
import Alamofire

public class YelpService: NSObject, ServiceProtocol {
    
    private static let Url: String = "https://api.yelp.com/v2/search"
    private static let ConsumerKey: String = "KYwum5JY_tOVvObefPzF5A"
    private static let ConsumerSecret: String = "YqJtzEpgBgoSLNT2EO5CjbMVGQc"
    private static let Token: String = "87uB8dcVpGTVexi6d1vT0A-e--bwpgEn"
    private static let TokenSecrent: String = "19sDBGvmr2fIO2BEDGpRtGB1Rm8"
    
    /**
     Function that executes a basic search through Zomato API for a location
     based on given parameters
     
     - parameter n:   the Name of the restaurant
     - parameter lat: latitude as float
     - parameter lng: longitude as float
     - parameter rad: the radius in meters
     */
    public static func search(name n: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        
        var nonce: String = String.createUUID(6)
        let timeInterval = (NSInteger)(NSDate().timeIntervalSince1970)
        
        let finalUrl = "https://api.yelp.com/v2/search?term=kazan&location=London&cll=51.500152,-0.126236&oauth_consumer_key=KYwum5JY_tOVvObefPzF5A&oauth_token=87uB8dcVpGTVexi6d1vT0A-e--bwpgEn&oauth_signature_method=HMAC-SHA1&oauth_timestamp=\(timeInterval)&oauth_nonce=\(nonce)&oauth_version=1.0&oauth_signature=QBmGFvymKq2ye5g0MTKYhyWEt+o="
        print(finalUrl)
        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
            print(response)
        }
        
    }
    
    static func details(id pid: String, callback: ([String : AnyObject]) -> Void) {
        // nothing
    }
}
