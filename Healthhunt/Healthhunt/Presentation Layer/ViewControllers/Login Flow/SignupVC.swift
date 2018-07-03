//
//  SignupVC.swift
//  HealthHunt
//
//  Created by Abhishek Kumar on 30/06/18.
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
    
    private func setUI() {
        
        btnSignup.backgroundColor = .themeColor
        btnSignup.layer.shadowOffset = CGSize(width: 0, height: 2)
        btnSignup.layer.shadowOpacity = 0.2
        
        textViewTermsConditions.attributedText = HHUtility.getTermsAndConditions()
        textViewTermsConditions.linkTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.darkGray]
    }
    
    @IBAction func actionSignup(_ sender: UIButton) {
        
        if Validation.validte(email: txtEmail.text!, password: txtPassword.text!) {
            
            view.endEditing(true)
            apiSignup()
        }
    }
    
    @IBAction func actionOffer(_ sender: UIButton) {
    }
    
    // MARK: API

    func apiSignup() {
        
        ProgressUtility.shared.showLoader()
        
        let param: [String: String] = [API.Key.Signup.email: txtEmail.text ?? "",
                                       API.Key.Signup.password: txtPassword.text ?? "",
                                       API.Key.Signup.name: "_iOS",
                                       API.Key.Signup.gender: "_Male",
                                       API.Key.Signup.social_token: "",
                                       API.Key.Signup.social_network: ""]
        
        APIManager.postAPI(API.URL.signup, parameters: param, tag: .signup) { (response, error) in
            
            ProgressUtility.shared.hideLoader()
            
            if (error != nil) {
                AlertUtility.sclAlertError(error!)
            } else {
                // Signup success
                AlertUtility.sclAlertSuccess(Message.signupSuccess)
            }
        }
    }
}

// MARK: Text Field Method

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

// MARK: Text View Method

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

