import UIKit
import Alamofire

//Login first?
let user = "flywww004@gmail.com"
let password = "f126614466"
let loginData = String(format: "%@:%@", user, password).data(using: String.Encoding.utf8)!


let base64LoginData = loginData.base64EncodedString()
let loginHeaders = [//"Authorization" : "Basic \(base64LoginData)",
    "cache-control": "no-cache",
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
]

let host = "http://127.0.0.1:8000/"
let loginAPI = "api/v1/rest-auth/login/"
let loginUrl = host + loginAPI
//let loginRequest = ["email": "flywww004@gmail.com", "password":"f126614466"]

let loginParams = [
    "email": "flywww004@gmail.com",
    "password": "f126614466"
]
//
//Alamofire.request(loginUrl, method: .post, parameters: loginParams)
//    .responseJSON { (response) in
//        print("Login!!!")
//        print(response)
//        print(response.request?.allHTTPHeaderFields)
//        print(response.response)
//        //let JSON = response.result as! NSDictionary
//        print(response.result)
//        print(response.error)
//        print("end\n\n")
//}




let headers = [
    "Authorization" : "Basic \(base64LoginData)",
    "cache-control": "no-cache",
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
]
//
Alamofire.request("http://127.0.0.1:8000/api/v1/categories/" ,headers: headers)
         .responseJSON { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")

            print(response.result)
        if let json = response.result.value {
                print("json: \(json)")
            }
}


//let logoutAPI = "api/v1/rest-auth/logout/"
//let logoutUrl = host + logoutAPI
//let logoutRequest = ["email": "flywww004@gmail.com", "password":"f126614466"]
//
//Alamofire.request(logoutUrl, method: .post)
//    .responseJSON { (response) in
//        print("Logout!!!")
//        print(response)
//        print(response.request)
//        print(response.response)
//        //let JSON = response.result as! NSDictionary
//        print(response.result)
//        print(response.error)
//        print("end\n\n")
//}
