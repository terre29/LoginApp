//
//  LoginPresenter.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation

class LoginPresenter {
    weak var view: LoginPresenterToView?
    var interactor: LoginPresenterToInteractor?
    var router: LoginPresenterToRouter?

}

extension LoginPresenter: LoginViewToPresenter {
    
    func doLogin(email: String?, password: String?) {
        interactor?.doLogin(email: email, password: password)
    }
    
}

extension LoginPresenter: LoginInteractorToPresenter {
    func doLoginSuccess() {
        view?.stopLoading()
        router?.routeToHomePage()
    }
    
    func doLoginFailed(error: String) {
        view?.showLoginFailed(error: error)
        view?.stopLoading()
    }
    
}
