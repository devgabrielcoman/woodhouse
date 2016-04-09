//
//  CityGrid.swift
//  Pods
//
//  Created by Gabriel Coman on 09/04/2016.
//
//

import UIKit
import Dollar
import Alamofire

public class CityGridService: NSObject, ServiceProtocol {

    private static let detailsUrl: String = "https://api.citygridmedia.com/content/places/v2/detail"
    private static let searchUrl: String = "https://api.citygridmedia.com/content/places/v2/search/latlon"
    private static let Key: String = "10000015518"
    
    public static func search(name n: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        var query: [String] = []
        if let n = n {
            query.append("what=\(n)".urlEncode())
        }
        if let lat = lat {
            query.append("lat=\(lat)")
        }
        if let lng = lng {
            query.append("lon=\(lng)")
        }
        if let rad = rad {
            query.append("radius=\(rad)")
        }
        query.append("publisher=\(Key)")
        query.append("type=restaurant")
        query.append("format=json")
        query.append("rpp=5")
        let finalUrl = searchUrl + (query.count > 0 ? "?" + query.joinWithSeparator("&") : "")
        
        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
            
            switch response.result {
            case .Success(let JSON):
                if let JSON = JSON as? [String:AnyObject],
                    let response = JSON["results"] as? [String:AnyObject],
                    let venues = response["locations"] as? [[String:AnyObject]] {
                    
                    $.each(venues) { (venue: [String:AnyObject]) in
                        if let phone = venue["phone_number"] as? String {
                            details(id: phone) { (detail: [String : AnyObject]) in
                                print(detail)
                                print("<><><><><><><><><><><>")
                                print(mapCityGridToOMenu(detail))
                            }
                        }
                    }
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    static func details(id pid: String, callback: ([String : AnyObject]) -> Void) {
        var query: [String] = []
        query.append("publisher=\(Key)")
        query.append("phone=\(pid)")
        query.append("format=json")
        query.append("client_ip=127.0.0.1")
        let finalUrl = detailsUrl + "?" + query.joinWithSeparator("&")
        
        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
            switch response.result {
            case .Success(let JSON):
                if let detail = JSON as? [String:AnyObject],
                   let locations = detail["locations"] as? [[String:AnyObject]],
                   let final = locations[0] as? [String: AnyObject]
                {
                    callback(final)
                } else {
                    callback([:])
                }
            case .Failure(let error):
                callback([:])
            }
        }
    }
}
