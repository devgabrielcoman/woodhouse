//
//  YelpAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class YelpAuth: NSObject, AuthProtocol {
    
    static let sharedInstance = YelpAuth()
    
    func method() -> AuthMethod {
        return .OAUTH
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "oauth_consumer_key":"KYwum5JY_tOVvObefPzF5A",
            "oauth_token":"87uB8dcVpGTVexi6d1vT0A-e--bwpgEn",
            "oauth_consumer_secret":"YqJtzEpgBgoSLNT2EO5CjbMVGQc",
            "oauth_token_secret":"19sDBGvmr2fIO2BEDGpRtGB1Rm8"
        ]
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
}
