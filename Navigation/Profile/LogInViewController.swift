import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let loginTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email or phone"
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 16)
        tf.tintColor = UIColor(named: "VK")
        tf.autocapitalizationType = .none
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 10
        tf.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // скругление только сверху
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.rightView = paddingView
        tf.rightViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 16)
        tf.tintColor = UIColor(named: "VK")
        tf.isSecureTextEntry = true
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 10
        tf.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.rightView = paddingView
        tf.rightViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        if let backgroundImage = UIImage(named: "blue_pixel") {
            button.setBackgroundImage(backgroundImage, for: .normal)
            button.setBackgroundImage(backgroundImage.withAlpha(0.8), for: .selected)
            button.setBackgroundImage(backgroundImage.withAlpha(0.8), for: .highlighted)
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupScrollView()
        setupElements()
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Setup
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupElements() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginTF)
        contentView.addSubview(passwordTF)
        contentView.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([

            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            loginTF.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginTF.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginTF.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTF.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTF.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 0),
            passwordTF.leadingAnchor.constraint(equalTo: loginTF.leadingAnchor),
            passwordTF.trailingAnchor.constraint(equalTo: loginTF.trailingAnchor),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: loginTF.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginTF.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    // MARK: - Keyboard Handling
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets.bottom = keyboardSize.height
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UIImage Extension
extension UIImage {
    func withAlpha(_ alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
