//
//  GoogleAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class GoogleAuth: NSObject, AuthProtocol {
    
    static let sharedInstance = GoogleAuth()
    
    func method() -> AuthMethod {
        return .SIMPLE
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "key":"AIzaSyAfdp5QoHl0fwrBmUAq-dqCvPMuwLPcou8"
        ]
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
}
