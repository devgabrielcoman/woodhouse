//
//  OMenuGroup.swift
//  Pods
//
//  Created by Liviu Coman on 02/03/16.
//
//

import UIKit
import Nosce
import Dollar

class OMenuGroup: NSObject {
    var groupName: String!
    var groupNote: String!
    var groupDescription: String!
    var groupUid: String!
    var disabled: Bool!
    var menuItems: [OMenuItem] = []
    
    override init() {
        super.init()
    }
    
    func printModel(){
        Nosce.printObject(reflecting: self, alias: "Menu Group:", tab: 1, exceptFields: ["menuItems"])
        $.each(menuItems) { (index, menuItem: OMenuItem) in
            menuItem.printModel()
        }
    }
}
