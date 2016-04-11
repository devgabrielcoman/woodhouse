//
//  ZomatoAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class ZomatoAuth: NSObject, AuthProtocol {
    
    static let sharedInstance = ZomatoAuth()
    
    func method() -> AuthMethod {
        return .SIMPLE
    }
    
    func query() -> [String : AnyObject]? {
        return nil
    }
    
    func header() -> [String : AnyObject]? {
        return [
            "user_key":"f69ef3e17a2826849fcd6e9398a9ba84"
        ]
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
}
