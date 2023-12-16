//
//  HomeView.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit
import SwiftUI

class HomeView: UIViewController, HomePresenterToView {
    var presenter: HomeViewToPresenter?
    let userListTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func setupView() {
        view.addSubview(userListTableView)
        userListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupTableView() {
        userListTableView.dataSource = self
        userListTableView.delegate = self
        
        userListTableView.register(UserListTableViewCell.self, forCellReuseIdentifier: "userListCell")
    }
    
    func showGetUserDataFailed(error: String) {
        view.addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: view.topAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        errorLabel.text = error
    }
    
    func reloadUserTableView() {
        userListTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        presenter?.doGetData()
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getNumberOfRowInSection(tableView, numberOfRowsInSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter?.cellForRowAt(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    
}
