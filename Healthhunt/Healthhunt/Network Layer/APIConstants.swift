//
//  ConstantWebService.swift
//  Petbook
//
//  Created by ASPL on 03/09/16.
//  Copyright © 2016 ASPL. All rights reserved.
//

import Foundation

// Error Messsages
let kMessage_common = "Some Error Occurred"

// URL TAGS

enum URLTag {
    case login, signup, forgotPasword
}

struct AppURL {
    
//    static let base = "https://staging.healthhunt.in/wp-json/sd2/v0.1/wp-json/sd2/v0.1/" // Staging URL
    static let base = "http://www.healthhunt.in/wp-json/sd2/v0.1/"  // Live URL

    static let login = "login"
    static let signup = "signup"
    static let forgotPasword = "forgot_password"
}

struct Key {
    
    static let deviceType = "deviceType"
    static let authToken = "authToken"
    static let apiVersion = "apiVersion"
    static let timeStamp = "timestamp"
    static let contentType = "Content-Type"
    static let sessionToken = "sessionToken"
}
