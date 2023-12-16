//
//  UserListTableViewCell.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit
import Kingfisher

class UserListTableViewCell: UITableViewCell {
    
    let baseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        stackView.spacing = 16
        return stackView
    }()
    
    let photoProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return imageView
    }()
    
    let informationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private func setupLayout() {
        addSubview(baseStackView)
        baseStackView.addArrangedSubview(photoProfileImage)
        baseStackView.addArrangedSubview(informationStackView)
        
        informationStackView.addArrangedSubview(fullNameLabel)
        informationStackView.addArrangedSubview(emailLabel)
        
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        photoProfileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: topAnchor),
            baseStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            baseStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            photoProfileImage.heightAnchor.constraint(equalToConstant: 72),
            photoProfileImage.widthAnchor.constraint(equalToConstant: 72),
        ])
    }
    
    func setupCell(viewModel: UserListModel) {
        setupLayout()
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            photoProfileImage.kf.setImage(with: viewModel.photoProfile)
            fullNameLabel.text = "Full Name: \(viewModel.firstName) \(viewModel.lastName)"
            emailLabel.text = "Email: \(viewModel.email)"
            photoProfileImage.layer.cornerRadius = 36
            photoProfileImage.layer.masksToBounds = true
        }
        
    }
    
}
