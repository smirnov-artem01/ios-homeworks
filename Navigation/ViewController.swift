import UIKit

class ViewController: UIViewController {

    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Перейти", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(actionButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            actionButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for:
                .touchUpInside)
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        let profileViewController = ProfileViewController()
        
        profileViewController.modalTransitionStyle = .coverVertical
        profileViewController.modalPresentationStyle = .fullScreen
        
        present(profileViewController, animated: true)
    }
}
