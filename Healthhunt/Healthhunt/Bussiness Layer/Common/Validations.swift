//
//  Validations.swift
//  MemoryHelper
//
//  Created by ChicMic on 01/06/17.
//  Copyright © 2017 ChicMic. All rights reserved.
//

import UIKit

class Validation: NSObject {

    class func validte(email: String, password: String) -> Bool {
        
        if email.isEmpty {
            AlertUtility.showTopBanner("Please enter email")
        }
        else if password.isEmpty {
            AlertUtility.showTopBanner("Please enter password")
        }
        else {
            return true
        }
        return false
    }
}
