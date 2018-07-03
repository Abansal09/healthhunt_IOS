//
//  Validations.swift
//  MemoryHelper
//
//  Created by Abhishek Kumar on 01/06/17.
//  Copyright © 2017 Abhishek Kumar. All rights reserved.
//

import UIKit

class Validation: NSObject {

    class func validte(email: String, password: String) -> Bool {
        
        if email.isEmpty {
            AlertUtility.showTopBanner(Message.validationEmail)
        }
        else if password.isEmpty {
            AlertUtility.showTopBanner(Message.validationPassword)
        }
        else {
            return true
        }
        return false
    }
}
