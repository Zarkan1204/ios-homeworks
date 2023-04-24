//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Мой Macbook on 07.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profileHeaderView = ProfileHeaderView()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Profile Button", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 25)
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        setupViews()
        setConstrains()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .systemGray6
        view.addSubview(profileHeaderView)
        view.addSubview(profileButton)
    }
    
    @objc private func profileButtonTapped() {
        print("Tap")
    }
}
 
extension ProfileViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            profileButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

