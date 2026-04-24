import UIKit
import StorageService

class PostViewController: UIViewController {

    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        title = post?.author ?? "Пост"  // или post?.description
        setupInfoBarButton()
    }

    private func setupInfoBarButton() {
        let infoButton = UIBarButtonItem(
            image: UIImage(systemName: "info.circle"),
            style: .plain,
            target: self,
            action: #selector(infoTapped)
        )
        navigationItem.rightBarButtonItem = infoButton
    }

    @objc private func infoTapped() {
        let infoVC = InfoViewController()
        let nav = UINavigationController(rootViewController: infoVC)
        present(nav, animated: true)
    }
}
