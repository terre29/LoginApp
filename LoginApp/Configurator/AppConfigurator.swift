//
//  LoginConfigurator.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit

class AppConfigurator {
    static let shared = AppConfigurator()
    
    func createLoginView() -> UIViewController {
        let view: UIViewController & LoginPresenterToView = LoginView()
        let presenter: LoginViewToPresenter & LoginInteractorToPresenter = LoginPresenter()
        let interactor: LoginPresenterToInteractor = LoginInteractor()
        let router: LoginPresenterToRouter = LoginRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
    
    func createHomeView() -> UIViewController {
        let view: UIViewController & HomePresenterToView = HomeView()
        let presenter: HomeViewToPresenter & HomeInteractorToPresenter = HomePresenter()
        let interactor: HomePresenterToInteractor = HomeInteractor()
       
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
