//
//  FoursquareAuth.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

class FoursquareAuth: NSObject, AuthProtocol {
    static func auth() -> [String : String]? {
        return [
            "client_id":"OXL4H4WB5BUFGAGTWFBX2FIEB3QNG1OCQCBMZQLOV3G1YTUJ",
            "client_secret":"W2YVIMKADZD54GZRZGPXDWM4515GP2GC5JCZUVGRTLBWPM33",
            "v":"20130815"
        ]
    }
}
