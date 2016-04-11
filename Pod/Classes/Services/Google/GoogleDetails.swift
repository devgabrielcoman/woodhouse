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
        dataService.serviceDelegate = self
        dataService.authDelgate = GoogleAuth.sharedInstance
    }
    
    func apiurl() -> String {
        return "https://maps.googleapis.com/maps/api/place/details/json"
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "placeid":placeId
        ]
    }
    
    func header() -> [String : AnyObject]? {
        return nil
    }
    
    func body() -> [String : AnyObject]? {
        return nil
    }
    
    func process(JSON: AnyObject) -> AnyObject {
        if  let detail = JSON as? [String:AnyObject],
            let final = detail["result"] as? [String:AnyObject] {
            return final
        }
        return [:]
    }
    
    public func search(placeid p: String) {
        placeId = p
        dataService.execute()
    }
}
