//
//  LoginViewController.swift
//  Sample_Healthhunt_iOS
//
//  Created by Abhishek Kumar on 6/28/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if validateLoginCredential() {
            login()
        }
    }
    
    
    func login() {
        ServiceManager.sharedInstance.login(useremail: emailField.text!, password: passwordField.text!, completion: { (strResponse) in
            DispatchQueue.main.async {
                print(strResponse)
            }
        }) { (error) in
            print(error)
        }
    }
    
    
    func validateLoginCredential() -> Bool {
        if !((emailField.text?.isEmpty)!) && !((emailField.text?.isEmpty)!){
            return true
        }
        return false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
