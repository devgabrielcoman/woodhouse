//
//  LocuAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class LocuAuth: NSObject, AuthProtocol {
    static func auth() -> [String : String]? {
        return [
            "api_key":"a246184db3876f5e20ffdbeea74188e79670c49d"
        ]
    }
}
