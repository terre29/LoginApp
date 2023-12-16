//
//  LoginInteractor.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import Moya

class LoginInteractor: LoginPresenterToInteractor {
    var presenter: LoginInteractorToPresenter?
    
    func doLogin(email: String?, password: String?) {
        let provider = MoyaProvider<LoginService>()
        
        let request = LoginRequest(
            email: email ?? "",
            password: password ?? ""
        )
        
        provider.request(.login(req: request), completion: { [weak self] result in
            switch result {
            case .success(_):
                self?.presenter?.doLoginSuccess()
                
            case .failure(let err):
                let userInfo = err.errorUserInfo
                self?.presenter?.doLoginFailed(error: userInfo["error"] as? String ?? "")
            }
        })
    }
    
}

   
