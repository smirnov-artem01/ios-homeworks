//
//  InfoViewController.swift
//  Navigation
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Информация"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Закрыть", style: .plain, target: self, action: #selector(closeTapped))
        setupAlertButton()
    }

    @objc private func closeTapped() {
        dismiss(animated: true)
    }

    private func setupAlertButton() {
        let button = UIButton(type: .system)
        button.setTitle("Показать алерт", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showAlertTapped), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func showAlertTapped() {
        let alert = UIAlertController(
            title: "Внимание",
            message: "Выберите действие",
            preferredStyle: .alert
        )
        let action1 = UIAlertAction(title: "ОК", style: .default) { _ in
            print("Нажата кнопка ОК")
        }
        let action2 = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            print("Нажата кнопка Отмена")
        }
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true)
    }
}
