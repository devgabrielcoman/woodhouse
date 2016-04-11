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
 * Auth Type enum
 */
enum AuthMethod {
    case NONE
    case SIMPLE
    case OAUTH
}

/**
 *  Protocol for Authentication portion of each service
 */
protocol AuthProtocol {
    func method() -> AuthMethod
    func query() -> [String:AnyObject]?
    func header() -> [String:AnyObject]?
    func body() -> [String:AnyObject]?
}

/**
 *  Normal function that each API service must respect
 */
protocol ServiceProtocol {
    func apiurl() -> String
    func method() -> String
    func query() -> [String:AnyObject]?
    func header() -> [String:AnyObject]?
    func body() -> [String:AnyObject]?
    func process(JSON: AnyObject) -> AnyObject
}

/**
 * Class that implements the ServiceProtocol
 */
class DataService: NSObject {
    
    /**
     * delegate variable for the Data Service class
     */
    public var serviceDelegate: ServiceProtocol? = nil
    public var authDelgate: AuthProtocol? = nil
    
    /**
     * override init
     */
    override init() {
        super.init()
    }
    
    /**
     The main public function of the Data Service
     */
    func execute()  {
        guard let serviceDelegate = serviceDelegate! as? ServiceProtocol else { return }
        guard let authDelgate = authDelgate! as? AuthProtocol else { return }
        
        // 1. the three vars for the request
        var url = serviceDelegate.apiurl()
        var query: [String:AnyObject] = [:]
        var header: [String:AnyObject] = [:]
        var body: [String:AnyObject] = [:]
        var authQuery: [String:AnyObject] = [:]
        var authHeader:[String:AnyObject] = [:]
        var authBody:[String:AnyObject] = [:]
        
        // 2. get additional data
        if let q = serviceDelegate.query() {
            query = q
        }
        if let h = serviceDelegate.header() {
            header = h
        }
        if let b = serviceDelegate.body() {
            body = b
        }
        
        // 3. get auth data
        if let q = authDelgate.query() {
            authQuery = q
        }
        if let h = authDelgate.header() {
            authHeader = h
        }
        if let b = authDelgate.body() {
            authBody = b
        }
        
        // 4. sum data
        sumParameters(into: &query, from: authQuery)
        sumParameters(into: &header, from: authHeader)
        sumParameters(into: &body, from: authBody)
        
        // 5. form the request
        let finalUrl = url + flattenQuery(query)
        let finalBody = serializeBody(body)
        let URL = NSURL(string: finalUrl)!
        let req = NSMutableURLRequest(URL: URL)
        req.HTTPMethod = serviceDelegate.method()
        req.HTTPBody = finalBody
        for key in header.keys {
            if let value = header[key]! as? String {
                req.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        // 6. start the request
        Alamofire.request(req).responseJSON { response in
            switch response.result {
            case .Success(let JSON):
                let result = serviceDelegate.process(JSON)
                print(result)
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
    private func flattenQuery(query:[String:AnyObject]) -> String {
        var queryArray:[String] = []
        
        for key in query.keys {
            if let value = query[key]! as? AnyObject {
                queryArray.append("\(key)=\(value)")
            }
        }
        if queryArray.count >= 1 {
            return "?" + queryArray.joinWithSeparator("&")
        }
        return ""
    }
    
    /**
     Function that serializes a set of POST parameters
     
     - parameter parameters: a dictionary containing all POST parameters
     
     - returns: an optional NSData value
     */
    private func serializeBody(body:[String:AnyObject]) -> NSData? {
        if body.count == 0 { return nil }
        var data: NSData
        do {
            data = try NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions.PrettyPrinted)
        } catch {
            return nil
        }
        return data
    }
    
    /**
     Adds to a referenced "into" dictionary the keys from another "from" dictionary
     
     - parameter i: the reference "into" dictionary
     - parameter f: the "from" dictionary
     */
    private func sumParameters(inout into i: [String:AnyObject], from f: [String:AnyObject]){
        for key in f.keys {
            i[key] = f[key]
        }
    }
}
