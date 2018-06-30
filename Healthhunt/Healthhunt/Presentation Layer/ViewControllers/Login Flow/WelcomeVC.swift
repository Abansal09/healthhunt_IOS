//
//  WelcomeVC.swift
//  HealthHunt
//
//  Created by Rajmani on 30/06/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

class WelcomeVC: BaseVC {

    enum Toggle {
        case login
        case signup
    }
    
    @IBOutlet weak var lblToggle: UILabel!
    @IBOutlet weak var btnToggle: UIButton!

    @IBOutlet weak var containerViewLogin: UIView!
    @IBOutlet weak var containerViewSignup: UIView!
   
    var currentToggle = Toggle.login
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toggle(to: .login)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func actionToggle(_ sender: UIButton) {
        
        if currentToggle == .login {
            toggle(to: .signup)
            currentToggle = .signup
        } else {
            currentToggle = .login
            toggle(to: .login)
        }
    }
    
    func toggle(to toggle: Toggle) {
        
        switch toggle {
        case .login:
            
            lblToggle.text = "Don't have an account?"
            btnToggle.setTitle("Sign Up", for: .normal)
            
            UIView.animate(withDuration: 0.25, animations: {
                self.containerViewLogin.alpha = 1
                self.containerViewSignup.alpha = 0
            })
            break
            
        case .signup:
            
            lblToggle.text = "Already have an account?"
            btnToggle.setTitle("Login", for: .normal)
            
            UIView.animate(withDuration: 0.25, animations: {
                self.containerViewLogin.alpha = 0
                self.containerViewSignup.alpha = 1
            })
            break
        }
    }
}
