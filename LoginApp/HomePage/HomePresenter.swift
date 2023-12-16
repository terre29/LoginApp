//
//  HomePresenter.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit
import Kingfisher

class HomePresenter {
    weak var view: HomePresenterToView?
    var interactor: HomePresenterToInteractor?
    
    var userList: [UserListModel] = []
}

extension HomePresenter: HomeViewToPresenter {
    
    func getNumberOfRowInSection(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userList.count
    }
    
    func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userListCell", for: indexPath) as? UserListTableViewCell else { return UITableViewCell() }
        cell.setupCell(viewModel: userList[indexPath.row])
        return cell
    }
  
    func doGetData() {
        interactor?.doGetUserList()
    }
    
    
}

extension HomePresenter: HomeInteractorToPresenter {
    func doGetDataSuccess(response: UserListResponse?) {
        guard let data = response?.data else {
            view?.showGetUserDataFailed(error: "There is an error, please try again later")
            return
        }
        userList = data.map({
            let photoURL = URL(string: $0.avatar ?? "") ?? URL(fileURLWithPath: "")
            return UserListModel(photoProfile: photoURL, firstName: $0.first_name ?? "", lastName: $0.last_name ?? "", email: $0.email ?? "")
        })
        view?.reloadUserTableView()
    }
    
    func doGetDataFailed(error: String) {
        view?.showGetUserDataFailed(error: error)
    }
    
    
}
