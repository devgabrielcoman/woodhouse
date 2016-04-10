//
//  ServiceProtocol.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//
//

import UIKit
import Dollar
import Alamofire

/**
 *  Protocol for Authentication portion of each service
 */
protocol AuthProtocol {
    static func auth() -> [String:String]?
}

/**
 *  Normal function that each API service must respect
 */
protocol ServiceProtocol {
    func apiurl() -> String
    func method() -> String
    func query() -> [String:AnyObject]?
    func headers() -> [String:String]?
    func parameters() -> [String:AnyObject]?
}

/**
 * Class that implements the ServiceProtocol
 */
class DataService: NSObject {
    
    public var delegate: ServiceProtocol? = nil
    
    override init() {
        super.init()
    }
    
    /**
     The main public function of the Data Service
     */
    func execute()  {
        guard let delegate = delegate! as? ServiceProtocol else { return; }
        
        // 1. form url
        var url = delegate.apiurl()
        if let query = delegate.query(),
           let queryString = flattenQuery(query) {
           url += "?" + queryString
        }
        
        // 2. form the request
        let URL = NSURL(string: url)!
        let req = NSMutableURLRequest(URL: URL)
        req.HTTPMethod = delegate.method()
        
        // 3. add the http body, if it exists
        if let parameters = delegate.parameters(),
           let parameterData = serializePost(parameters) {
            req.HTTPBody = parameterData
        }
        
        // 4. add headers one by one
        if let headers = delegate.headers() {
            for key in headers.keys {
                if let value = headers[key]! as? String {
                    req.setValue(value, forHTTPHeaderField: key)
                }
            }
        }
        
        // 5. start the request
        Alamofire.request(req).responseJSON { response in
            switch response.result {
            case .Success(let JSON):
                print(JSON)
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
            
        }
    }
    
    /**
     This function flattens out a GET query
     
     - parameter query: a dictionary containing the Query elements
     
     - returns: a optional query string in the form name1=param1&name2=param2 ... 
     */
    private func flattenQuery(query:[String:AnyObject]) -> String? {
        var queryArray:[String] = []
        
        for key in query.keys {
            if let value = query[key]! as? AnyObject {
                queryArray.append("\(key)=\(value)")
            }
        }
        if queryArray.count >= 1 {
            return queryArray.joinWithSeparator("&")
        }
        return nil
    }
    
    /**
     Function that serializes a set of POST parameters
     
     - parameter parameters: a dictionary containing all POST parameters
     
     - returns: an optional NSData value
     */
    private func serializePost(parameters:[String:AnyObject]) -> NSData? {
        var data: NSData
        do {
            data = try NSJSONSerialization.dataWithJSONObject(parameters, options: NSJSONWritingOptions.PrettyPrinted)
        } catch {
            return nil
        }
        return data
    }
}
