//
//  InfoViewController.swift
//  Navigation
//
//  Created by Мой Macbook on 07.04.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Alert", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 25)
        button.addTarget(self, action: #selector(tapAlertButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9487732629, green: 1, blue: 0.654224046, alpha: 1)
        
        view.addSubview(alertButton)
     }
    
    @objc private func tapAlertButton() {
        let alertController = UIAlertController(title: "Привет Нео", message: "Какую таблетку выберешь?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Синяя", style: .default) { _ in
            print("Синяя")
        }
        let deleteAction = UIAlertAction(title: "Красная", style: .destructive) { _ in
            print("Красная")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension InfoViewController {
    
   private func setConstraints() {
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.widthAnchor.constraint(equalToConstant: 150),
            alertButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
