//
//  ApiECHO.swift
//  
//
//  Created by Vitalii Havryliuk on 9/13/18.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiECHO {
    
    //MARK: - Properties
    
    static let shared = ApiECHO()
    
    //MARK: - Methods
    
    func signup(name: String, email: String, password: String, completion: @escaping (_ accessToken: String?, _ errorMessage: String?) -> Void) {
        Alamofire.request("https://apiecho.cf/api/signup/", method: .post,
                          parameters: ["name": name,
                                       "email": email,
                                       "password": password])
            .responseJSON { response in
                guard response.result.isSuccess, let value = response.result.value else {
                    print("Error while sign up: \(String(describing: response.result.error))")
                    completion(nil, "Error while sign up")
                    return
                }
                guard JSON(value)["success"] == true else {
                    let errorMessage = JSON(value)["errors"][0]["message"].stringValue
                    completion(nil, errorMessage)
                    return
                }
                let accessToken = JSON(value)["data"]["access_token"].stringValue
                completion(accessToken, nil)
        }
    }
    
    
    func login(email: String, password: String, completion: @escaping (_ accessToken: String?, _ errorMessage: String?) -> Void) {
        Alamofire.request("https://apiecho.cf/api/login/",
                          method: .post,
                          parameters: ["email": email,
                                       "password": password])
            .responseJSON { response in
                guard response.result.isSuccess, let value = response.result.value else {
                    print("Error while login: \(String(describing: response.result.error))")
                    completion(nil, "Error while login")
                    return
                }
                guard JSON(value)["success"] == true else {
                    let errorMessage = JSON(value)["errors"][0]["message"].stringValue
                    completion(nil, errorMessage)
                    return
                }
                let accessToken = JSON(value)["data"]["access_token"].stringValue
                completion(accessToken, nil)
        }
    }

    
}
