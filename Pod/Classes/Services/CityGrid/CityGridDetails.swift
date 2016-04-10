//
//  CityGridDetails.swift
//  Pods
//
//  Created by Gabriel Coman on 10/04/2016.
//
//

import UIKit

public class CityGridDetails: NSObject, ServiceProtocol {
    
    private var phone: String = ""
    private var dataService: DataService = DataService()
    
    public override init() {
        super.init()
        dataService.delegate = self
    }
    
    func apiurl() -> String {
        return "https://api.citygridmedia.com/content/places/v2/detail"
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "format":"json",
            "client_ip":"127.0.0.1",
            "publisher": (CityGridAuth.auth()?["publisher"])!,
            "phone":phone
        ]
    }
    
    func headers() -> [String : String]? {
        return nil
    }
    
    func parameters() -> [String : AnyObject]? {
        return nil
    }
    
    func process(JSON: AnyObject) -> AnyObject {
        if let detail = JSON as? [String:AnyObject],
           let locations = detail["locations"] as? [[String:AnyObject]],
           let final = locations[0] as? [String: AnyObject] {
           return final
        }
        return [:]
    }
    
    public func search(phone p: String) {
        self.phone = p
        dataService.execute()
    }
}
