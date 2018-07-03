//
//  WelcomeVC.swift
//  HealthHunt
//
//  Created by Abhishek Kumar on 30/06/18.
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
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewTop: UIView!
    
    @IBOutlet weak var containerViewLogin: UIView!
    @IBOutlet weak var containerViewSignup: UIView!
   
    var currentToggle = Toggle.login
    
    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUI() {
        
        // Set Theme Color
        
        view.backgroundColor = .lightBGColor
        viewTop.backgroundColor = .lightBGColor
        
        btnToggle.setTitleColor(.themeColor, for: .normal)
        lblTitle.textColor = .themeColor
        
        // Default to Login
        toggle(to: .login)
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
            
            self.containerViewLogin.alpha = 1
            self.containerViewSignup.alpha = 0
            containerViewLogin.transform = containerViewLogin.transform.translatedBy(x: -containerViewLogin.bounds.width, y: 0)
            
            UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseInOut], animations: {
                self.containerViewLogin.transform = .identity
            }, completion: nil)
            break
            
        case .signup:
            
            lblToggle.text = "Already have an account?"
            btnToggle.setTitle("Login", for: .normal)
            
            self.containerViewLogin.alpha = 0
            self.containerViewSignup.alpha = 1
            containerViewSignup.transform = containerViewSignup.transform.translatedBy(x: containerViewSignup.bounds.width, y: 0)
            
            UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseInOut], animations: {
                self.containerViewSignup.transform = .identity
            }, completion: nil)
            break
        }
    }
}
