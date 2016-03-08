//
//  OMenuMenu.swift
//  Pods
//
//  Created by Liviu Coman on 02/03/16.
//
//

import UIKit
import Nosce
import Dollar

class OMenuMenu: NSObject {
    var menuName: String!
    var menuDescription: String!
    var menuNote: String!
    var currencySymbol: String!
    var language: String!
    var disabled: Bool!
    var menuUid: String!
    var menuDurationName: String!
    var menuDurationTimeStart: String!
    var menuDurationTimeEnd: String!
    var menuGroups: [OMenuGroup] = []
    
    override init(){
        super.init()
    }
    
    func printModel() {
        Nosce.printObject(reflecting: self, alias: "Menu:", tab: 0, exceptFields: ["menuGroups"])
        $.each(menuGroups) { (index, menuGroup: OMenuGroup) in
            menuGroup.printModel()
        }
    }
}
