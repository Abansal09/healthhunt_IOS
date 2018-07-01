//
//  CommonFunction.swift
//  MemoryHelper
//
//  Created by ChicMic on 01/06/17.
//  Copyright © 2017 ChicMic. All rights reserved.
//
import UIKit
import NVActivityIndicatorView
import SCLAlertView
import NotificationBannerSwift

let logo = "logo"

class AlertUtility: NSObject, NVActivityIndicatorViewable {

    static var alertView = SCLAlertView()
    
    static func sclAlertError(_ string: String) {
        
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: false
        )
        
        let alert1 = SCLAlertView(appearance: appearance)
        
        DispatchQueue.main.async {
            alert1.showError("", subTitle: string, closeButtonTitle:"OK", timeout: nil, colorStyle: 0x9FCD33, colorTextButton: 0xFFFFFF, circleIconImage: UIImage(named:logo), animationStyle: SCLAnimationStyle.topToBottom)
        }
    }
    
    static func showTopBanner(_ string: String) {
        
        DispatchQueue.main.async {
            let banner = NotificationBanner(title: "", subtitle: string, style: .danger)
            banner.show()
        }
    }
    
    static func removeSuperView() {
        
        DispatchQueue.main.async {
            alertView.hideView()
        }
    }
}
