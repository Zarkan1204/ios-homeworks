//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Мой Macbook on 28.04.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func imageCellTaped(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PhotosCollectionViewCell"
    weak var delegate: CustomCellDelegate?
    private var indexPathCell = IndexPath()
    
    private let photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
        addGesture()
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
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photoView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.imageCellTaped(photoView.image, frameImage: photoView.frame, indexPath: indexPathCell)
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
