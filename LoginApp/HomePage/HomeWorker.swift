//
//  HomeWorker.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import Moya

enum HomeService {
    case userList(req: HomeUserListRequest)
}

extension HomeService: TargetType {
    var baseURL: URL {
        URL(string: "https://reqres.in/api")!
    }
    
    var path: String {
        "/users"
    }
    
    var method: Moya.Method {
        switch self {
        case .userList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .userList(let req):
            return .requestParameters(parameters: ["page": req.page], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    

}
