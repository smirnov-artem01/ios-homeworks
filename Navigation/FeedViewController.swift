import UIKit

class FeedViewController: UIViewController {

    private let post = Post.makePosts().first!
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Первый пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Второй пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = "Feed"
        
        setupStackView()
        setupButtons()
    }

    private func setupStackView() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupButtons() {
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        firstButton.addTarget(self, action: #selector(openPostTapped), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(openPostTapped), for: .touchUpInside)
    }

    @objc private func openPostTapped() {
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
