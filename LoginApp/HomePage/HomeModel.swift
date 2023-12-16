//
//  HomeModel.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit

struct HomeUserListRequest {
    let page: Int
}

struct UserListModel {
    let photoProfile: URL
    let firstName: String
    let lastName: String
    let email: String
}

struct UserListResponse: Decodable {
    let data: [UserListData]?
}
    
struct UserListData: Decodable {
    var id: Int?
    var email: String?
    var first_name: String?
    var last_name: String?
    var avatar: String?
}

