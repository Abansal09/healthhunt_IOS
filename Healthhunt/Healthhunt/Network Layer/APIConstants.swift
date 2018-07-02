//
//  ConstantWebService.swift
//  Petbook
//
//  Created by Abhishek Kumar on 03/09/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import Foundation

// Error Messsages
let kMessage_common = "Some Error Occurred"

// URL TAGS

struct API {
    
    enum URLTag {
        case login, signup, forgotPasword
    }
    
    struct URL {
        
        static let base = "https://staging.healthhunt.in/wp-json/sd2/v0.1/" // Staging URL
        //    static let base = "http://www.healthhunt.in/wp-json/sd2/v0.1/"  // Live URL
        
        static let login = "login"
        static let signup = "signup"
        static let forgotPasword = "forgot_password"
    }
    
    struct HeaderKey {
        
        static let authUrl = "/wp-json/sd2/v0.1/"
        static let privateKey = "Zzxp23s9Vb91mh20"
        static let type = "iOS"
        static let serverVersion = "v0.1"
        static let contentTypeVal = "application/json"
        
        static let deviceType = "deviceType"
        static let authToken = "authToken"
        static let apiVersion = "apiVersion"
        static let timeStamp = "timestamp"
        static let contentType = "Content-Type"
        static let sessionToken = "sessionToken"
    }
    
    struct Key {
        
        struct Login {
            
            static let email = "email"
            static let password = "password"
            static let social_network = "social_network"
            static let social_token = "social_token"
        }
        
        struct Signup {
            
            static let email = "email"
            static let password = "password"
            static let social_network = "social_network"
            static let social_token = "social_token"
            static let name = "name"
            static let gender = "gender"
        }
    }
}





