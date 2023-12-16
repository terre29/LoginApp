//
//  LoginRouter.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit

class LoginRouter: LoginPresenterToRouter {
    var view: UIViewController? = nil
    
    init() {}
    
    func routeToHomePage() {
        let homeView = AppConfigurator.shared.createHomeView()
        view?.navigationController?.show(homeView, sender: nil)
    }
    
}
