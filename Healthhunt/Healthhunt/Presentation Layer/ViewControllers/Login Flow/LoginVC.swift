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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if validateLoginCredential() {
            login()
        }
    }

    func login() {
        ServiceManager.sharedInstance.login(useremail: txtEmail.text!, password: txtPassword.text!, completion: { (strResponse) in
            DispatchQueue.main.async {
                print(strResponse)
            }
        }) { (error) in
            print(error)
        }
    }

    func validateLoginCredential() -> Bool {
        if !((txtEmail.text?.isEmpty)!) && !((txtEmail.text?.isEmpty)!) {
            return true
        }
        return false
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
    }
    
    @IBAction func actionForgotPassword(_ sender: UIButton) {
    }
}

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
