//
//  YelpAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class YelpAuth: NSObject, AuthProtocol {
    static func auth() -> [String : String]? {
        return [
            "oauth_consumer_key":"KYwum5JY_tOVvObefPzF5A",
            "ConsumerSecret":"YqJtzEpgBgoSLNT2EO5CjbMVGQc",
            "Token":"87uB8dcVpGTVexi6d1vT0A-e--bwpgEn",
            "TokenSecret":"19sDBGvmr2fIO2BEDGpRtGB1Rm8"
        ]
    }
}