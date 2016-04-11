//
//  CityGridAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

public class CityGridAuth: NSObject, AuthProtocol {
    
    static let sharedInstance = CityGridAuth()
    
    func method() -> AuthMethod {
        return .SIMPLE
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "publisher":"10000015518"
        ]
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
}
