//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Мой Macbook on 28.04.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PhotosCollectionViewCell"
    
    private let photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: PhotosModel) {
        photoView.image = UIImage(named: model.image)
    }
    
    private func setupViews() {
        backgroundColor = .red
        layer.cornerRadius = 15
        contentView.addSubview(photoView)
    }
}

extension PhotosCollectionViewCell {
    private func setupContraints() {
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
