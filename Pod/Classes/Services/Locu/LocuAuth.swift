//
//  LocuAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class LocuAuth: NSObject, AuthProtocol {
    
    static let sharedInstance = LocuAuth()
    
    func method() -> AuthMethod {
        return .SIMPLE
    }
    
    func query() -> [String : AnyObject]? {
        return nil
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return [
            "api_key":"a246184db3876f5e20ffdbeea74188e79670c49d"
        ]
    }
}
