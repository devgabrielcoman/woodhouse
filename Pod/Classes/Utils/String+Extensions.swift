//
//  String+Extensions.swift
//  Pods
//
//  Created by Gabriel Coman on 21/03/2016.
//
//

import UIKit

public extension String {
    func upercaseFirst() -> String {
        let lowercaseString = self.lowercaseString
        return lowercaseString.stringByReplacingCharactersInRange(lowercaseString.startIndex...lowercaseString.startIndex, withString: String(lowercaseString[lowercaseString.startIndex]).uppercaseString)
    }
    
    func sub(start: Int, _ end: Int) -> String {
        if start > end { return self }
        if end > self.characters.count { return self }
        let range = self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end)
        return self.substringWithRange(range)
    }
    
    static func createUUID(uuidLength: Int) -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyz0123456789"
        let length = alphabet.characters.count
        
        var uuid: [String] = []
        for _ in 0 ..< uuidLength {
            let rand = Int(arc4random_uniform((__uint32_t)(length)))
            let char = alphabet.sub(rand, rand+1)
            uuid.append(char)
        }
        
        return uuid.joinWithSeparator("")
    }
    
    static func createOmfUUID() -> String {
        let p1 = createUUID(8)
        let p2 = createUUID(4)
        let p3 = createUUID(4)
        let p4 = createUUID(4)
        let p5 = createUUID(5)
        return "\(p1)-\(p2)-\(p3)-\(p4)-\(p5)"
    }
}

