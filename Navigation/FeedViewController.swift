//
//  FeedViewController.swift
//  Navigation
//
//  Created by Мой Macbook on 07.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
     var post: Post = Post(title: "Мой пост")


    private lazy var postButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Post", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 25)
        button.addTarget(self, action: #selector(tapPostButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(postButton)
     }
    
    @objc func tapPostButton() {
        let postViewController = PostViewController()
        postViewController.post = post
        navigationController?.pushViewController(postViewController, animated: true)
    }
}

extension FeedViewController {
    
   private func setConstraints() {
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postButton.widthAnchor.constraint(equalToConstant: 150),
            postButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
