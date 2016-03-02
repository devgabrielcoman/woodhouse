//
//  Nosce.swift
//  Pods
//
//  Created by Gabriel Coman on 01/03/2016.
//
//

import UIKit
import Dollar

// 
// Nosce is a small library that uses reflection to print out the contents of
// model-type object
// ideal candidates are classes in the form:
//
//  class SomeModel {
//      var name: String;
//      var points: Int;
//  }
//
public class Nosce: NSObject {
    
    // 
    // succession of more specific printObject functions
    public static func printObject(reflecting subject: Any) {
        printObject(reflecting: subject, alias: nil, tab: 0, fields: [])
    }
    
    public static func printObject(reflecting subject: Any, alias _alias: String?) {
        printObject(reflecting: subject, alias: _alias, tab: 0, fields: [])
    }
    
    public static func printObject(reflecting subject: Any, alias _alias: String?, tab _tab: Int) {
        printObject(reflecting: subject, alias: _alias, tab: _tab, fields: [])
    }
    
    //
    // this is the most generic of the printObject series function, and the one
    // that all the other rely on
    // @param subject - the reflecting "Any" type object that's going to be printed
    // @param alies - a human readable name for the Model being presented
    // @param tab - the number of indents to add
    // @param fields - the fields to take into account
    public static func printObject(reflecting subject: Any, alias _alias: String?, tab _tab: Int, fields _fields: [String]) {
        // create the mirror
        let dict = getObjectFieldsAndValues(reflecting: subject)
        
        // sort out the tabs
        var tabs = ""
        for (var i = 0; i < _tab && _tab > 0; i++) {
            tabs += "\t"
        }
        
        // print object type
        if let alias = _alias {
            print(tabs + alias)
        } else {
            print(tabs + "\(subject.dynamicType)")
        }
        
        // print fields
        let noFields = _fields.count
        for member: String in dict.keys {
            if $.contains(_fields, value: member) || noFields == 0 {
                print(tabs + "\t\(member) = \(dict[member]!)")
            }
        }
    }
    
    public static func printObject(reflecting subject: Any, alias _alias: String?, tab _tab: Int, exceptFields _fields: [String]) {
        // create the mirror
        let dict = getObjectFieldsAndValues(reflecting: subject)
        
        // sort out the tabs
        var tabs = ""
        for (var i = 0; i < _tab && _tab > 0; i++) {
            tabs += "\t"
        }
        
        // print object type
        if let alias = _alias {
            print(tabs + alias)
        } else {
            print(tabs + "\(subject.dynamicType)")
        }
        
        // print fields
        let noFields = _fields.count
        for member: String in dict.keys {
            if !$.contains(_fields, value: member) || noFields == 0 {
                print(tabs + "\t\(member) = \(dict[member]!)")
            }
        }
    }
    
    private static func getObjectFieldsAndValues(reflecting subject: Any) -> [String : String] {
        // get the mirrored object
        let mirrored = Mirror(reflecting: subject)
        
        // create an empty dictionary
        var labelValDict: [String : String] = [:]
        
        // interate through the mirror to find member names and values
        for (_, attr) in mirrored.children.enumerate() {
            if let property_name = attr.label as String! {
                labelValDict[property_name] = "\(attr.value)"
            }
        }
        
        // return the doct
        return labelValDict
    }
}
