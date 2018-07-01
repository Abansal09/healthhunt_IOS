//
//  LoginVC.swift
//  HealthHunt
//
//  Created by Abhishek Kumar on 6/28/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {

    // MARK: IBOutlets
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    @IBOutlet weak var btnLogin: UIButton!
    
    // MARK: Variables
    

    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Reset entries
        txtEmail.text = nil
        txtPassword.text = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUI() {
        
        btnLogin.backgroundColor = .themeColor
        btnLogin.layer.shadowOffset = CGSize(width: 0, height: 2)
        btnLogin.layer.shadowOpacity = 0.2
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        
        if Validation.validte(email: txtEmail.text!, password: txtPassword.text!) {
            
            view.endEditing(true)
            apiLogin()
        }
    }
    
    @IBAction func actionForgotPassword(_ sender: UIButton) {
    
    }
}

// MARK: API

extension LoginVC {
    
    func apiLogin() {
        
        ProgressUtility.shared.showLoader()
        
        let param: [String: String] = ["email": txtEmail.text ?? "",
                                       "password": txtPassword.text ?? "",
                                       "social_network": "",
                                       "social_token": ""]
        
        APIManager.postAPI(AppURL.login, parameters: param, tag: .login) { (response, error) in
            
            ProgressUtility.shared.hideLoader()
            
            if (error != nil) {
                AlertUtility.sclAlertError(error!)
            } else {
                print(response as Any)
            }
        }
    }
}

// MARK: Text Field Method

extension LoginVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
