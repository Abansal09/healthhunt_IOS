//
//  UIStoryboard+Loader.swift
//  EazyWallet
//
//  Created by Abhishek Kumar on 04/05/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

private enum Storyboard: String {
    case login = "Login"
}

fileprivate extension UIStoryboard {

    // instantiating view controller from a specific storyboard
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: App View Controllers
extension UIStoryboard {

    class func loadLoginVC() -> LoginVC {
        return load(from: .login, identifier: "LoginVC") as! LoginVC
    }

    class func loadSignupVC() -> SignupVC {
        return load(from: .login, identifier: "SignupVC") as! SignupVC
    }
}
