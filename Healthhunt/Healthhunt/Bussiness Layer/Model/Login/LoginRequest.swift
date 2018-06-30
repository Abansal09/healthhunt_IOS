//
//  LoginRequest.swift
//  HealthHunt
//
//  Created by Abhishek Kumar on 6/30/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

struct LoginRequest: Codable {
    let email: String?
    let password: String?
    let social_network: String?
    let social_token: String?
}
