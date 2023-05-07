//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Мой Macbook on 28.04.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifier: String = "PhotosTableViewCell"
    
    var photo1: UIImageView!
    var photo2: UIImageView!
    var photo3: UIImageView!
    var photo4: UIImageView!
    
    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let imageArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image =  UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        imageView.transform = transform
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.tintColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addPhoto()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addPhoto() {
        photo1 = createImageView(nameImageView: "imageView1", nameImage: "1")
        photo2 = createImageView(nameImageView: "imageView2", nameImage: "2")
        photo3 = createImageView(nameImageView: "imageView3", nameImage: "3")
        photo4 = createImageView(nameImageView: "imageView4", nameImage: "4")
    }
    
    private func setupViews(){
        [backView, photo1, photo2, photo3, photo4, titleLabel, imageArrow].forEach{contentView.addSubview($0)}
    }
}
   
extension PhotosTableViewCell {
    func createImageView(nameImageView: String, nameImage: String) -> UIImageView{
        let nameImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: nameImage)
            imageView.layer.cornerRadius = 6
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }()
        return nameImageView
    }
}

extension PhotosTableViewCell {
    private func setupConstraints() {
        let photoSize: CGFloat = contentView.frame.width / 3.7
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: backView.topAnchor ,constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 12),
            
            photo1.widthAnchor.constraint(equalToConstant: photoSize),
            photo1.heightAnchor.constraint(equalToConstant: photoSize),
            photo1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 12),
            photo1.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 12),
            photo1.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
            
            photo2.widthAnchor.constraint(equalToConstant: photoSize),
            photo2.heightAnchor.constraint(equalToConstant: photoSize),
            photo2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 12),
            photo2.leadingAnchor.constraint(equalTo: photo1.trailingAnchor,constant: 8),
            photo2.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
            
            photo3.widthAnchor.constraint(equalToConstant: photoSize),
            photo3.heightAnchor.constraint(equalToConstant: photoSize),
            photo3.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 12),
            photo3.leadingAnchor.constraint(equalTo: photo2.trailingAnchor,constant: 8),
            photo3.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
            
            photo4.widthAnchor.constraint(equalToConstant: photoSize),
            photo4.heightAnchor.constraint(equalToConstant: photoSize),
            photo4.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 12),
            photo4.leadingAnchor.constraint(equalTo: photo3.trailingAnchor,constant: 8),
            photo4.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
            
            imageArrow.widthAnchor.constraint(equalToConstant: 30),
            imageArrow.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            imageArrow.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
}



