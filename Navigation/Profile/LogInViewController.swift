//
//  LogInViewController.swift
//  Navigation
//
//  Created by Мой Macbook on 19.04.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email or phone"
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.tintColor = .gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftViewMode = .always
        textField.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingDidEndOnExit)
        return textField
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Password"
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.tintColor = .gray
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftViewMode = .always
        textField.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingDidEndOnExit)
        return textField
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "bluepixel")
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        switch button.state {
        case .selected: button.alpha = 0.8
        case .highlighted: button.alpha = 0.8
        case .disabled: button.alpha = 0.8
        default: button.alpha = 1
        }
        return button
    }()
    
    private let warningPasswordLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberPasswordCharacters = 6
    private let correctUserName = "Chubaka"
    private let correctPassword = "qwerty"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
        addGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
        }
    }

    @objc private func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(warningPasswordLabel)
    }
    
    @objc private func loginButtonTapped() {
        
        if loginTextField.text?.isEmpty == true {
            shakeTextField(to: loginTextField)
            return
        }
        
        if passwordTextField.text?.isEmpty == true {
            shakeTextField(to: passwordTextField)
            return
        }
        
        if let password = passwordTextField.text, password.count < numberPasswordCharacters {
            warningPasswordLabel.text = "Пароль должен быть более 5 символов"
            warningPasswordLabel.isHidden = false
            return
        }
     
        if loginTextField.text != correctUserName || passwordTextField.text != correctPassword {
            let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
        warningPasswordLabel.isHidden = true
    }

    @objc func textFieldShouldReturn() {
        view.endEditing(true)
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
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(textFieldShouldReturn))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
}

extension LogInViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100.5),
            
            loginTextField.topAnchor.constraint(equalTo: stackView.topAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            loginTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            separatorView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            separatorView.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            passwordTextField.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            warningPasswordLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            warningPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            warningPasswordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
