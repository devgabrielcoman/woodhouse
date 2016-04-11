//
//  FoursquareAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class FoursquareAuth: NSObject, AuthProtocol {
    
    static let sharedInstance = FoursquareAuth()
    
    func method() -> AuthMethod {
        return .SIMPLE
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "client_id":"OXL4H4WB5BUFGAGTWFBX2FIEB3QNG1OCQCBMZQLOV3G1YTUJ",
            "client_secret":"W2YVIMKADZD54GZRZGPXDWM4515GP2GC5JCZUVGRTLBWPM33",
            "v":"20130815"
        ]
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
}
