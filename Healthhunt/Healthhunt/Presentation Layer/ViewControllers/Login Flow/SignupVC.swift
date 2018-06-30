//
//  SignupVC.swift
//  HealthHunt
//
//  Created by Rajmani on 30/06/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

class SignupVC: BaseVC {

    // MARK: IBOutlets

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var textViewTermsConditions: UITextView!
   
    @IBOutlet weak var btnOffer: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    
    // MARK: Variables
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUI() {
        
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
        textViewTermsConditions.linkTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.darkGray]
        textViewTermsConditions.attributedText = text
    }
    
    @IBAction func actionSignup(_ sender: UIButton) {
    }
    
    @IBAction func actionOffer(_ sender: UIButton) {
    }
}

extension SignupVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}

extension SignupVC: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.absoluteString == "termsAndConditions" {
            print("Terms And Conditions")
        } else if URL.absoluteString == "privacyPolicy" {
            print("Privacy Policy")
        }
        
        return false
    }
}

