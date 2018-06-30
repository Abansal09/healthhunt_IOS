//
//  HHUtility.swift
//  Sample_Healthhunt_iOS
//
//  Created by Abhishek Kumar on 6/30/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

class HHUtility: NSObject {


    static public func getMD5(_ string: String) -> String {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, string, CC_LONG(string.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate(capacity: 1)
        var hexString = ""
        for byte in digest {
            hexString += String(format:"%02x", byte)
        }
        return hexString
    }
    
    static public func getUTCTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")
        let date = NSDate()
        let convertedDate = formatter.string(from: date as Date)
        return convertedDate
    }
}
