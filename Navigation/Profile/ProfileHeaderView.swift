//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мой Macbook on 12.04.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private lazy var userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "chubaka")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarTap)))
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTap)))
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Chubaka"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 25)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.placeholder = "Enter your status"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setConstrains()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(userNameLabel)
        addSubview(statusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(backView)
        addSubview(userPhotoImageView)
        addSubview(closeButton)
    }
    
    @objc private func buttonPressed() {
        if statusTextField.text?.isEmpty == true {
            shakeTextField(to: statusTextField)
        } else {
            statusLabel.text = statusText
            statusTextField.text = ""
            endEditing(true)
        }
    }
    
    private func shakeTextField(to textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
    
    private func addGesture() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapScreen.cancelsTouchesInView = false
        addGestureRecognizer(tapScreen)
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc func hideKeyboard() {
        endEditing(true)
    }
    
    @objc private func avatarTap() {
        UIView.animate(withDuration: 0.5, animations: {
            self.userPhotoImageView.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.backView.frame = .init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 395, height: 710))
            self.userPhotoImageView.center = self.backView.center
            self.userPhotoImageView.layer.cornerRadius = 0
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
                self.backView.alpha = 1
            }
        }
    }
    
    @objc private func closeButtonTap() {
        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.userPhotoImageView.frame = .init(origin: CGPoint(x: 16, y: 16), size: CGSize(width: 100, height: 100))
                self.userPhotoImageView.transform = .identity
                self.userPhotoImageView.layer.cornerRadius = 50
                self.backView.alpha = 0
            })
        }
    }
}

extension ProfileHeaderView {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            userPhotoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            
            userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 16),

            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -5),
            statusLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: -9),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: userPhotoImageView.bottomAnchor),

            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.topAnchor.constraint(equalTo: userPhotoImageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
