//
//  ServiceManager.swift
//  Sample_Healthhunt_iOS
//
//  Created by Abhishek Kumar on 6/30/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {
    
    //let baseUrlStr = "https://staging.healthhunt.in/wp-json/sd2/v0.1/wp-json/sd2/v0.1/"
    
    static let sharedInstance = ServiceManager()
    
    override init() {
        super.init()
    }
    
    func requestManager(request:URLRequest, completion: @escaping(Data) ->Void, failure: @escaping(Bool)->Void){
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if (data != nil) {
                completion(data!)
            }
            else {
                failure(false)
            }
        })
        task.resume()
    }
    
    func login(useremail: String, password: String, completion: @escaping(String) -> Void, failure: @escaping(Bool) -> Void) {
        
    
        var request = URLRequest(url: URL(string: baseUrl + "/login")!)
        request.httpMethod = postMethod
        
        let loginRequest = LoginRequest(email: useremail, password: password, social_network: nil, social_token: nil)
        
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(loginRequest)
            // ... and set our request's HTTP body
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            completion("error")
        }
        
        let utcTime = HHUtility.getUTCTime()
        let authCode = authUrl + privateKey + utcTime;
        
        let authVal = HHUtility.getMD5(authCode)
        request.addValue(authVal, forHTTPHeaderField: authToken)
        request.addValue(utcTime, forHTTPHeaderField: timeStamp)
        request.addValue(type, forHTTPHeaderField: deviceType)
        request.addValue(serverVersion, forHTTPHeaderField: apiVersion)
        request.addValue(contentTypeVal, forHTTPHeaderField: contentType)
        
        
        }
}
