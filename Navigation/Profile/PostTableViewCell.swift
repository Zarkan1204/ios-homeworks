//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Мой Macbook on 25.04.2023.
//

import UIKit

protocol IncreaselikesDelegate: AnyObject {
    func increaselikes(for model: inout[Post], indexPath: IndexPath)
}

class PostTableViewCell: UITableViewCell {
    
    weak var delegate: IncreaselikesDelegate?
    private var indexPathCell = IndexPath()
    private var model = Post.makeModel()
    static let identifier: String = "PostTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstrains()
        addTapLikesLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        authorLabel.text = nil
        descriptionLabel.text = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        [authorLabel, postImageView, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0)
        }
    }
    
    func setupCell(model: Post) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addTapLikesLabel() {
        let tapLikesLabel = UITapGestureRecognizer(target: self, action: #selector(tapLikes))
        likesLabel.addGestureRecognizer(tapLikesLabel)
    }
    
    @objc func tapLikes() {
        delegate?.increaselikes(for: &model, indexPath: indexPathCell)
        likesLabel.text = "Likes: " + String(model[indexPathCell.row].likes)
    }
}

extension PostTableViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            viewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
