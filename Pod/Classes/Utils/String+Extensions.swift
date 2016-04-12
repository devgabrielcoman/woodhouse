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
    
    func urlEncode() -> String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
    }
    
    func percentEscape() -> String {
        return CFURLCreateStringByAddingPercentEscapes(
            nil,
            self,
            nil,
            "!*'();:@&=+$,/?%#[]",
            CFStringBuiltInEncodings.UTF8.rawValue
            ) as String
    }
    
    //
    // Posted in: http://stackoverflow.com/questions/26501276/converting-hex-string-to-nsdata-in-swift
    // Author: Rob (http://stackoverflow.com/users/1271826/rob)
    // Inspired by Martin R at http://stackoverflow.com/a/26284562/1271826
    // - returns: NSData represented by this hexadecimal string. Returns nil if string contains characters outside the 0-9 and a-f range.
    
    func dataFromHexadecimalString() -> NSData? {
        let trimmedString = self.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<> ")).stringByReplacingOccurrencesOfString(" ", withString: "")
        
        // make sure the cleaned up string consists solely of hex digits, and that we have even number of them
        
        let regex = try! NSRegularExpression(pattern: "^[0-9a-f]*$", options: .CaseInsensitive)
        
        let found = regex.firstMatchInString(trimmedString, options: [], range: NSMakeRange(0, trimmedString.characters.count))
        if found == nil || found?.range.location == NSNotFound || trimmedString.characters.count % 2 != 0 {
            return nil
        }
        
        // everything ok, so now let's build NSData
        
        let data = NSMutableData(capacity: trimmedString.characters.count / 2)
        
        for var index = trimmedString.startIndex; index < trimmedString.endIndex; index = index.successor().successor() {
            let byteString = trimmedString.substringWithRange(Range<String.Index>(start: index, end: index.successor().successor()))
            let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
            data?.appendBytes([num] as [UInt8], length: 1)
        }
        
        return data
    }
}

