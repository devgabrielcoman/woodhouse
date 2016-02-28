//
//  ServiceProtocol.swift
//  Pods
//
//  Created by Gabriel Coman on 23/02/2016.
//
//

import UIKit

protocol ServiceProtocol {
    static func searchNameGeo(name n: String?, latitude lat: Float?, longitude lng: Float?)
    static func searchName(name n:String)
    static func searchGeo(latitude lat: Float, longitude lng: Float)
}