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
    
    class func getTermsAndConditions() -> NSMutableAttributedString {
        
        let text = NSMutableAttributedString(string: "By signing up, you agree to ")
        text.addAttribute(NSAttributedStringKey.font,
                          value: UIFont.systemFont(ofSize: 12),
                          range: NSRange(location: 0, length: text.length))
        
        let termsAndConditions = NSMutableAttributedString(string: "Terms and Conditions")
        termsAndConditions.addAttribute(NSAttributedStringKey.font,
                                        value: UIFont.systemFont(ofSize: 12),
                                        range: NSRange(location: 0, length: termsAndConditions.length))
        
        // Adding the link interaction to the interactable text
        termsAndConditions.addAttribute(NSAttributedStringKey.link,
                                        value: "termsAndConditions",
                                        range: NSRange(location: 0, length: termsAndConditions.length))
        
        let textAnd = NSMutableAttributedString(string: " and ")
        text.addAttribute(NSAttributedStringKey.font,
                          value: UIFont.systemFont(ofSize: 12),
                          range: NSRange(location: 0, length: text.length))
        
        let privacyPolicy = NSMutableAttributedString(string: "Privacy Policy")
        privacyPolicy.addAttribute(NSAttributedStringKey.font,
                                   value: UIFont.systemFont(ofSize: 12),
                                   range: NSRange(location: 0, length: privacyPolicy.length))
        
        privacyPolicy.addAttribute(NSAttributedStringKey.link,
                                   value: "privacyPolicy",
                                   range: NSRange(location: 0, length: privacyPolicy.length))
        
        text.append(termsAndConditions)
        text.append(textAnd)
        text.append(privacyPolicy)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        text.addAttribute(kCTParagraphStyleAttributeName as NSAttributedStringKey, value: paragraphStyle, range: NSMakeRange(0, text.length))
        text.addAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.lightGray], range: NSMakeRange(0, text.length))
        
        return text
    }
}
