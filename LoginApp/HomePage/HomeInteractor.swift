//
//  HomeInteractor.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import Moya

class HomeInteractor: HomePresenterToInteractor {

    var presenter: HomeInteractorToPresenter?
    
    func doGetUserList() {
        let provider = MoyaProvider<HomeService>()
        
        let request = HomeUserListRequest(page: 2)
        
        provider.request(.userList(req: request), completion: { [weak self] result in
            switch result {
            case .success(let resp):
                let json = resp.data
                let responseObject = try! JSONDecoder().decode(UserListResponse.self, from: json)

                self?.presenter?.doGetDataSuccess(response: responseObject)
            case .failure(_):
                self?.presenter?.doGetDataFailed(error: "There is an error, please try again later")
            }
            
        })
    }
}
