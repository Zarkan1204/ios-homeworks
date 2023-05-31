//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Мой Macbook on 28.04.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let photosModel = PhotosModel.maketPhoto()
    private var imageRect: CGRect = .zero
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.bounces = false
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.5
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 40, y: 220, width: 40, height: 40))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        return button
    }()
    
    private let animatingPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupContraints()
        collectionView.reloadData()
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        view.backgroundColor = .white
        title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc private func closeButtonTap() {
        animatedPhotoBack(rect: imageRect)
        closeButton.removeFromSuperview()
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(backView)
        view.addSubview(closeButton)
        view.addSubview(animatingPhoto)
        animatingPhoto.image = image
        animatingPhoto.alpha = 1.0
        animatingPhoto.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            self.backView.alpha = 0.5
            self.animatingPhoto.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingPhoto.center = self.view.center
            self.animatingPhoto.layer.cornerRadius = UIScreen.main.bounds.width / 2
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
            }
        }
    }
    
    private func animatedPhotoBack(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.backView.alpha = 0
            self.animatingPhoto.frame = rect
            self.animatingPhoto.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingPhoto.removeFromSuperview()
            self.closeButton.alpha = 0
            self.backView.removeFromSuperview()
        }
    }
}

extension PhotosViewController {
    private func setupContraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension PhotosViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier,
                                                      for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: photosModel[indexPath.row])
        cell.delegate = self
        cell.setIndexPath(indexPath)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 8}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

extension PhotosViewController: CustomCellDelegate {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let rectItem = collectionView.layoutAttributesForItem(at: indexPath)
        let rectInSuperView = collectionView.convert(rectItem?.frame ?? .zero, to: collectionView.superview)
        imageRect = CGRect(x: frameImage.origin.x + rectInSuperView.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        
        animateImage(image, imageFrame: imageRect)
    }
}
