//
//  ResponsePackage.swift
//  Jumeirah
//
//  Created by Rajmani on 21/02/17.
//  Copyright © 2016 ASPL. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class APIManager: NSObject {

    class func postAPI(_ apiURl: String, parameters: [String: Any], header: Bool = true, tag: URLTag, completionHandler: @escaping (_ Result: Any?, _ Error: String?) -> Void) {

        var finalData: Any? = nil
        var theError: String? = nil

        var headerToken: [String: String] = [:]

        if header {

//            headerToken = ["AccessToken":System.profile.token!]
        }

        print(parameters)

        let api = Alamofire.request(AppURL.base + apiURl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header ? headerToken:nil)

        api.responseJSON { (response) in

            if let JSON = response.result.value {
                print("JSON: \(JSON)")

                if let response = JSON as? [String: Any] {

                    if response["status"] as! Bool == true {

                        switch tag {

//                        case .login:
//                            if let data = response["data"] as? [String:Any] {
//                                APIManager.setUserResponse(data: data)
//                            }
//
//                        case .registration:
//
//                            if let data = response["data"] as? [String:Any] {
//                                APIManager.setUserResponse(data: data)
//                            }

//                        case .allMessages:
//
//                            if let data = response["data"] as? [[String:Any]]  {
//                                finalData = Mapper<MessageList>().mapArray(JSONArray: data)
//                            }

                        default:
                            print("NO TAGS MATCHED")
                        }

                    } else {

                        theError = response["message"] as? String

                        if theError == "User does not exists!"{

//                            System.userDefaults.removeObject(forKey: "token")
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "logout"), object: nil, userInfo: nil)
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

    class func GetAPI(_ apiUrl: String, _ tag: URLTag, _ header: Bool = false, completionHandler: @escaping (_ Result: Any?, _ Error: String?) -> Void) {

        var finalData: Any? = nil
        var theError: String? = nil

        var headerToken: [String: String] = [:]

        if header {

//            headerToken = ["AccessToken":System.profile.token!]
        }

        let api = Alamofire.request(AppURL.base + apiUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header ? headerToken : nil)

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

                        //                        CommonFunction.shared.sclAlertError("Error")
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

    class func postMultipartAPI(_ apiURl: String, parameters: [String: String], tag: URLTag, fileData: Data, completionHandler: @escaping (_ Result: Any?, _ Error: String?) -> Void) {

        let finalData: Any? = nil
        var theError: String? = nil

        let headerToken: [String: String] = ["AccessToken": ""]

        let fullURL = try! URLRequest(url: AppURL.base + apiURl, method: .post, headers: headerToken)

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
//                                    theError = "Unidentified Request"
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
