//
//  GoogleDetails.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

public class GoogleDetails: NSObject, ServiceProtocol {
    
    private var placeId: String = ""
    private var dataService: DataService = DataService()
    
    public override init() {
        super.init()
        dataService.delegate = self
    }
    
    func apiurl() -> String {
        return "https://maps.googleapis.com/maps/api/place/details/json"
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "placeid":placeId,
            "key":(GoogleAuth.auth()?["key"])!
        ]
    }
    
    func headers() -> [String : String]? {
        return nil
    }
    
    func parameters() -> [String : AnyObject]? {
        return nil
    }
    
    public func search(placeid p: String) {
        placeId = p
        dataService.execute()
    }
}
