//
//  YellowPagesAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class YellowPagesAuth: NSObject, AuthProtocol {
    
    static let sharedInstance = YellowPagesAuth()
    
    func method() -> AuthMethod {
        return .SIMPLE
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "key":"qptcklyknd"
        ]
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
}
