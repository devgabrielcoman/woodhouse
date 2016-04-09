//
//  ServiceProtocol.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//
//

import UIKit

protocol ServiceProtocol {
    /**
     The basic Service protocol function needed to implement a search
     
     - parameter n:   the name query
     - parameter lat: latitude
     - parameter lng: longitude
     - parameter rad: radius
     */
    static func search(name n: String?, latitude lat: Float?, longitude lng: Float?, radius rad: Float?)
    static func details(id pid: String, callback: ([String:AnyObject]) -> Void)
}