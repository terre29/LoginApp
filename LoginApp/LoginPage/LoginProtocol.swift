//
//  LoginProtocol.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit

protocol LoginPresenterToView: AnyObject {
    var presenter: LoginViewToPresenter? { get set }
    

    func stopLoading()
    func showLoginFailed(error: String)
}

protocol LoginViewToPresenter: AnyObject {
    var view: LoginPresenterToView? { get set }
    var router: LoginPresenterToRouter? { get set }
    
    func doLogin(email: String?, password: String?)
}

protocol LoginInteractorToPresenter: AnyObject {
    var interactor: LoginPresenterToInteractor? { get set }
    
    func doLoginSuccess()
    func doLoginFailed(error: String)
}

protocol LoginPresenterToInteractor: AnyObject {
    var presenter: LoginInteractorToPresenter? { get set }
    func doLogin(email: String?, password: String?)
}

protocol LoginPresenterToRouter: AnyObject {
    var view: UIViewController? { get set }
    func routeToHomePage()
}
