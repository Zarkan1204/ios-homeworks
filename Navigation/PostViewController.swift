//
//  PostViewController.swift
//  Navigation
//
//  Created by Мой Macbook on 07.04.2023.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.6521153804, green: 1, blue: 0.9150592866, alpha: 1)
        barButtonItem()
        title = "Мой пост"
    }
    private func barButtonItem() {
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapInfoViewController))
        navigationItem.rightBarButtonItem = myButton
    }

    @objc private func tapInfoViewController() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
}
