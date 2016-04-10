//
//  ZomatoAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class ZomatoAuth: NSObject, AuthProtocol {
    static func auth() -> [String : String]? {
        return [
            "user_key":"f69ef3e17a2826849fcd6e9398a9ba84"
        ]
    }
}
