//
//  LoginModel.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation

struct LoginRequest: Decodable {
   
    let email: String
    let password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func toJSON() -> [String: Any] {
        return [
            "email": email,
            "password": password
        ]
    }
    
}

struct LoginResponse: Decodable {
    let token: String
}
