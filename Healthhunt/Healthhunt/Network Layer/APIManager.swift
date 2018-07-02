//
//  ResponsePackage.swift
//  Jumeirah
//
//  Created by Abhishek Kumar on 21/02/17.
//  Copyright © 2016 Abhishek Kumar. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class APIManager: NSObject {

    class func postAPI(_ apiURl: String, parameters: [String: Any], header: Bool = true, tag: API.URLTag, completionHandler: @escaping (_ Result: Any?, _ Error: String?) -> Void) {

        var finalData: Any? = nil
        var theError: String? = nil

        var headerToken: [String: String] = [:]

        if header {
            let utcTime = HHUtility.getUTCTime()
            let authCode = API.HeaderKey.authUrl + apiURl + API.HeaderKey.privateKey + utcTime
            
            headerToken = [API.HeaderKey.authToken: HHUtility.getMD5(authCode),
                           API.HeaderKey.timeStamp: utcTime,
                           API.HeaderKey.deviceType: API.HeaderKey.type,
                           API.HeaderKey.apiVersion: API.HeaderKey.serverVersion,
                           API.HeaderKey.contentType: API.HeaderKey.contentTypeVal
            ]
        }

        print(headerToken)
        print(parameters)
        print(API.URL.base + apiURl)
        
        let api = Alamofire.request(API.URL.base + apiURl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header ? headerToken:nil)

        api.responseJSON { (response) in

            if let JSON = response.result.value {
                print("JSON: \(JSON)")
              
                if let response = JSON as? [String: Any] {

                    if (response["status"] as? Bool)! {
                        
                        switch tag {

                        case .login:
                            // Method to parse response
                            break;

                        case .signup:
                            // Method to parse response
                            break;

                        default:
                            print("NO TAGS MATCHED")
                        }

                    } else {

                        theError = response["message"] as? String
                    }
                }
            } else if let ERROR = response.result.error {
                print("Error: \(ERROR)")
                theError =  ERROR.localizedDescription
            } else {
                theError = "Unknown error occurred"
            }

            completionHandler(finalData, theError)
        }
    }

    class func GetAPI(_ apiUrl: String, _ tag: API.URLTag, _ header: Bool = false, completionHandler: @escaping (_ Result: Any?, _ Error: String?) -> Void) {

        var finalData: Any? = nil
        var theError: String? = nil

        var headerToken: [String: String] = [:]

        let api = Alamofire.request(API.URL.base + apiUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header ? headerToken : nil)

        api.responseJSON { (response) in

            if let JSON = response.result.value {

                print("JSON: \(JSON)")

                if let response = JSON as? [String: Any] {

                    if response["status"] as! Bool == true {

                        switch tag {

                        default:
                            print("NO TAGS MATCHED")
                        }
                    } else {

                        if let error = response["error"] as? [String: Any] {
                            if let _ = error["api_token"] as? String {
                                completionHandler(nil, "api_token")
                                return
                            }
                        }
                    }
                }
            } else if let ERROR = response.result.error {
                print("Error: \(ERROR)")
                theError =  ERROR.localizedDescription
            } else {
                theError = "Unknown error occurred"
            }

            completionHandler(finalData, theError)
        }
    }

    class func postMultipartAPI(_ apiURl: String, parameters: [String: String], tag: API.URLTag, fileData: Data, completionHandler: @escaping (_ Result: Any?, _ Error: String?) -> Void) {

        let finalData: Any? = nil
        var theError: String? = nil

        let headerToken: [String: String] = ["AccessToken": ""]

        let fullURL = try! URLRequest(url: API.URL.base + apiURl, method: .post, headers: headerToken)

        Alamofire.upload(multipartFormData: { (multipartFormData) in

            multipartFormData.append(fileData, withName: "upload_image", fileName: "file.jpg", mimeType: "image/jpeg")

            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: key)
            }
        }, with: fullURL, encodingCompletion: { (result) in
            switch result {
            case .success(let upload, _, _):

                upload.responseJSON { response in

                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")

                        if let response = JSON as? [String: Any] {
                            if response["status"] as! Bool == true {
                                switch tag {

                                default:
                                    print("default tag")
                                }
                            } else {
                                //success false
                                if let message = response["message"] as? String {
                                    theError = message
                                } else {
                                    theError = "Request unsuccessful"
                                }
                            }
                        } else {
                            //Invalid response format
                            theError = "Invalid response format"
                        }
                    } else if let ERROR = response.result.error {
                        print("Error: \(ERROR)")
                        theError =  ERROR.localizedDescription
                    } else {
                        theError = "Unknown error occurred"
                    }
                    completionHandler(finalData, theError)
                }
            case .failure(let encodingError):
                completionHandler(nil, encodingError.localizedDescription)
            }
        })
    }
}
