//
//  BaseVC.swift
//  HealthHunt
//
//  Created by Rajmani on 30/06/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    // MARK: Variables

    private var tap = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUI() {
        
        tap = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
    }
    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
}

extension BaseVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.addGestureRecognizer(tap)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        view.removeGestureRecognizer(tap)
    }
}
