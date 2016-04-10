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

public class CityGridSearch: NSObject, ServiceProtocol {

    private var qry: String = ""
    private var lat: Float = 0
    private var lng: Float = 0
    private var rad: Float = 0
    private var dataService: DataService = DataService()
    
    public override init() {
        super.init()
        dataService.delegate = self
    }
    
    func apiurl() -> String {
        return "https://api.citygridmedia.com/content/places/v2/search/latlon"
    }
    
    func method() -> String {
        return "GET"
    }
    
    func query() -> [String : AnyObject]? {
        return [
            "type":"restaurant",
            "format":"json",
            "rpp":"5",
            "publisher": (CityGridAuth.auth()?["publisher"])!,
            "what":qry.urlEncode(),
            "lat":lat,
            "lon":lng,
            "radius":rad
        ]
    }
    
    func headers() -> [String : String]? {
        return nil
    }
    
    func parameters() -> [String : AnyObject]? {
        return nil
    }
    
    public func search(query qry: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?) {
        
        if let qry = qry, lat = lat, lng = lng, rad = rad {
            self.qry = qry; self.lat = lat; self.lng = lng; self.rad = rad
        }
        dataService.execute()
        
//        var query: [String] = []
//        if let n = n {
//            query.append("what=\(n)".urlEncode())
//        }
//        if let lat = lat {
//            query.append("lat=\(lat)")
//        }
//        if let lng = lng {
//            query.append("lon=\(lng)")
//        }
//        if let rad = rad {
//            query.append("radius=\(rad)")
//        }
//        query.append("publisher=\(Key)")
//        query.append("type=restaurant")
//        query.append("format=json")
//        query.append("rpp=5")
//        let finalUrl = url1 + (query.count > 0 ? "?" + query.joinWithSeparator("&") : "")
//        
//        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
//            
//            switch response.result {
//            case .Success(let JSON):
//                if let JSON = JSON as? [String:AnyObject],
//                    let response = JSON["results"] as? [String:AnyObject],
//                    let venues = response["locations"] as? [[String:AnyObject]] {
//                    
//                    $.each(venues) { (venue: [String:AnyObject]) in
//                        if let phone = venue["phone_number"] as? String {
//                            self.details(id: phone) { (detail: [String : AnyObject]) in
//                                print(detail)
//                                print("<><><><><><><><><><><>")
//                                print(mapCityGridToOMenu(detail))
//                            }
//                        }
//                    }
//                }
//            case .Failure(let error):
//                print("Request failed with error: \(error)")
//            }
//        }
    }
    
//    func details(id pid: String, callback: ([String : AnyObject]) -> Void) {
//        var query: [String] = []
//        query.append("publisher=\(Key)")
//        query.append("phone=\(pid)")
//        query.append("format=json")
//        query.append("client_ip=127.0.0.1")
//        let finalUrl = url2 + "?" + query.joinWithSeparator("&")
//        
//        Alamofire.request(.GET, finalUrl, parameters: nil, encoding: .JSON).responseJSON { response in
//            switch response.result {
//            case .Success(let JSON):
//                if let detail = JSON as? [String:AnyObject],
//                   let locations = detail["locations"] as? [[String:AnyObject]],
//                   let final = locations[0] as? [String: AnyObject]
//                {
//                    callback(final)
//                } else {
//                    callback([:])
//                }
//            case .Failure(let error):
//                callback([:])
//            }
//        }
//    }
}
