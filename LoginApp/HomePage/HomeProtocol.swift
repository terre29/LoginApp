//
//  HomeProtocol.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit

protocol HomePresenterToView: AnyObject {
    var presenter: HomeViewToPresenter? { get set }
    
    func showGetUserDataFailed(error: String)
    func reloadUserTableView()
   
}

protocol HomeViewToPresenter: AnyObject {
    var view: HomePresenterToView? { get set }

    func doGetData()
    func getNumberOfRowInSection(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

protocol HomeInteractorToPresenter: AnyObject {
    var interactor: HomePresenterToInteractor? { get set }
    
    func doGetDataSuccess(response: UserListResponse?)
    func doGetDataFailed(error: String)
}

protocol HomePresenterToInteractor: AnyObject {
    var presenter: HomeInteractorToPresenter? { get set }
    func doGetUserList()
}



