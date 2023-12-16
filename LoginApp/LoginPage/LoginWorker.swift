//
//  LoginWorker.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import Moya

enum LoginService {
    case login(req: LoginRequest)
}

extension LoginService: TargetType {
    var baseURL: URL {
        URL(string: "https://reqres.in/api/users")!
    }
    
    var path: String {
        "/login"
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let req):
            return .requestParameters(parameters: req.toJSON(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    

}
