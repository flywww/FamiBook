//
//  MainViewController.swift
//  FamiBook
//
//  Created by stan004 on 2018/7/25.
//  Copyright © 2018 stan004. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {

    
    @IBAction func loginButton(_ sender: Any) {
        UserModel.sharedInstance.login(email: "flywww004@gmail.com", password: "f126614466") { result in
            print(result)
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        UserModel.sharedInstance.logout { result in
            print(result)
        }
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        UserModel.sharedInstance.signUp(email: "flywww006@gmail.com", password1: "f126614466", password2: "f126614466") { request in
            print(request)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            print(UserModel.sharedInstance)
        
        }
    
    
        
//
//        let user = "flywww004@gmail.com"
//        let password = "f126614466"
//        let loginData = String(format: "%@:%@", user, password).data(using: String.Encoding.utf8)!
//
//        let host = "http://127.0.0.1:8000/"
//        let loginAPI = "api/v1/rest-auth/login/"
//        let loginUrl = host + loginAPI
//
//        let loginParams = [
//            "email": "flywww004@gmail.com",
//            "password": "f126614466"
//        ]
//
//        Alamofire.request(loginUrl, method: .post, parameters: loginParams)
//            .responseJSON { (response) in
//                print("Login!!!")
//                print(response)
//
//        }
//
//        let headers = [
//            "Authorization" : "Basic \(base64LoginData)",
//            "cache-control": "no-cache",
//            "Accept": "application/json",
//            "Content-Type": "application/x-www-form-urlencoded",
//            ]
//
//        Alamofire.request("http://127.0.0.1:8000/api/v1/categories/" ,headers: headers)
//            .responseJSON { response in
//                print("Request: \(response.request)")
//                print("Response: \(response.response)")
//                print("Error: \(response.error)")
//
//                print(response.result)
//                if let json = response.result.value {
//                    print("json: \(json)")
//                }
//        }
//
//
    
    
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

