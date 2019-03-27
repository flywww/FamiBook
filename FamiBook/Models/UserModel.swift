//
//  UserModel.swift
//  FamiBook
//
//  Created by stan004 on 2019/3/23.
//  Copyright © 2019 stan004. All rights reserved.
//

import UIKit
import Alamofire

let emailKey = "email"
let passwordKey = "password"
let avatarKey = "avatar"
let birthdayKey = "birthday"
let genderKey = "gender"
let daybookKey = "daybook"
let updateAtKey = "update_at"
let createAtKey = "create_at"

let host = "http://127.0.0.1:8000/"
let loginAPI = "api/v1/rest-auth/login/"
let loginUrl = host + loginAPI

let logoutAPI = "api/v1/rest-auth/logout/"
let logoutUrl = host + logoutAPI

let signUpAPI = "api/v1/rest-auth/registration/"
let signUpUrl = host + signUpAPI

let changePasswordAPI = "api/v1/rest-auth/password/change/"
let changePasswordUrl = host + changePasswordAPI



class UserModel: BaseModel {
    
    static let sharedInstance = UserModel()

    var email = UserDefaults.standard.string(forKey: emailKey) ?? ""
    var avatar = UserDefaults.standard.data(forKey: avatarKey) //TODO image translate
    var birthday = UserDefaults.standard.string(forKey: birthdayKey) //TODO str2Date
    var gender = UserDefaults.standard.bool(forKey: genderKey)
    var daybook = DaybookModel()
    var updateAt = UserDefaults.standard.bool(forKey: updateAtKey)
    var createAt = UserDefaults.standard.bool(forKey: createAtKey)
    
    
    
    func login(email:String, password:String, result:@escaping (DataResponse<Any>) -> Void) {
        
        let parameters = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(loginUrl, method: .post, parameters: parameters, encoding: URLEncoding.default)
                 .validate(statusCode: 200..<300)
                 .validate(contentType: ["application/json"])
                 .responseJSON { response in
                    
                switch response.result {
                case .success(_):
                    result(response)
                    break
                case .failure(_):
                    result(response)
                    break
                    }
        }
    }
    
    func logout(result:@escaping (Any) -> Void){
        
        Alamofire.request(logoutUrl, method: .post)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { (response) in
   
                switch response.result {
                case .success(_):
                    result(response)
                    break
                case .failure(_):
                    result(response)
                    break
                }
        }
    }
    
    func signUp(email:String, password1:String, password2:String, result:@escaping (Any) -> Void) {
        
        let parameters = [
            "email": email,
            "password1": password1,
            "password2": password2
        ]
        
        Alamofire.request(signUpUrl, method: .post, parameters: parameters, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                switch response.result {
                case .success(_):
                    result(response)
                    break
                case .failure(_):
                    result(response)
                    break
                }
        }
    }
    
    func getUserProfile(userId:Int ,result:@escaping (Any) -> Void) {
        
//        Alamofire.request(signUpUrl, method: .post, parameters: parameters, encoding: URLEncoding.default)
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseJSON { response in
//
//                switch response.result {
//                case .success(_):
//                    result(response)
//                    break
//                case .failure(_):
//                    result(response)
//                    break
//                }
//        }

    }
    
    
    
    //        let credentialData = "\(email):\(password)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    //       let base64Credentials = credentialData.base64EncodedString()
    //        let headers = [
    //            "Authorization": "Basic \(base64Credentials)",
    //            "Accept": "application/json",
    //            "Content-Type": "application/json" ]
    
    /*
 
     Write data:
     
     let imageData = UIImageJPEGRepresentation(image, 1)
     let relativePath = "image_\(NSDate.timeIntervalSinceReferenceDate()).jpg"
     let path = self.documentsPathForFileName(relativePath)
     imageData.writeToFile(path, atomically: true)
     NSUserDefaults.standardUserDefaults().setObject(relativePath, forKey: "path")
     NSUserDefaults.standardUserDefaults().synchronize()
     
     Read data:
     
     let possibleOldImagePath = NSUserDefaults.standardUserDefaults().objectForKey("path") as String?
     if let oldImagePath = possibleOldImagePath {
     let oldFullPath = self.documentsPathForFileName(oldImagePath)
     let oldImageData = NSData(contentsOfFile: oldFullPath)
     // here is your saved image:
     let oldImage = UIImage(data: oldImageData)
     }
     
     documentsPathForFileName:
     
     func documentsPathForFileName(name: String) -> String {
     let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true);
     let path = paths[0] as String;
     let fullPath = path.stringByAppendingPathComponent(name)
     
     return fullPath
     }
 
 */
    
    
    
    
    // CSRF https://www.objc.com//article/2018/3/25/48.html
    
    private override init() {}
    deinit {}
}



//let user = ***
//let password = ***
//let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
//let base64Credentials = credentialData.base64EncodedString(options: [])
//let headers = ["Authorization": "Basic \(base64Credentials)"]
//
//Alamofire.request(customerURL,
//                  method: .get,
//                  parameters: nil,
//                  encoding: URLEncoding.default,
//                  headers:headers)
//    .validate()
//    .responseJSON { response in
//        if response.result.value != nil{
//            print(response)
//        }else{
//
//        }
//}


