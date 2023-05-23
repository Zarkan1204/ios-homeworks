//
//  PostModalViewController.swift
//  Navigation
//
//  Created by Мой Macbook on 22.05.2023.
//


import UIKit

class PostModalViewController: UIViewController {
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = UIColor.systemGray
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let likesAndViewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemGray6
        likesAndViewsStackView.addArrangedSubview(viewsLabel)
        likesAndViewsStackView.addArrangedSubview(likesLabel)
        view.addSubview(authorLabel)
        view.addSubview(postImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(likesAndViewsStackView)
    }
    
    func setupData(model: Post) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
}
    
extension PostModalViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            likesAndViewsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesAndViewsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            likesAndViewsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
