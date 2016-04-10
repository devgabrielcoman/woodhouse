//
//  CityGridAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

public class CityGridAuth: NSObject, AuthProtocol {
    static func auth() -> [String : String]? {
        return [
            "publisher":"10000015518"
        ]
    }
}
