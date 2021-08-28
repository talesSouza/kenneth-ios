import UIKit

class LoginViewController: BaseViewController {

    // MARK: - Dependencies
    var viewModel: LoginViewModel = LoginViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
}

// MARK: - Life Cycle
extension LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setObserver()
    }
}

// MARK: - View State
extension LoginViewController {
    
    private func setObserver() {
        observe(viewModel.$state) { [weak self] state in
            guard let self = self else { return }
            self.changed(state: state)
        }
    }
    
    private func changed(state: LoginViewState) {
        switch state {
        case .started:
            setLayout()
        case .dataChanged:
            loginButton.isEnabled = viewModel.isValidData
        case .loading:
            break
        case .loginFailed:
            print("login failed")
        case .loginSucceeded:
            print("login succeeded")
        }
    }
}

// MARK: - Local Methods
extension LoginViewController {
    
    func setLayout() {
        let text = "Esqueci minha senha"
        forgotPasswordLabel.attributedText = text.setUnderlined()
    }
}

// MARK: - IBActions
extension LoginViewController {
    
    @IBAction private func loginTouchUpInside(_ sender: UIButton) {
        
        if let email = emailTextField.text, !email.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
            viewModel.login()
        } else {
            print("Preencha os campos")
        }
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if textField == emailTextField {
            viewModel.set(email: text)
        } else if textField == passwordTextField {
            viewModel.set(password: text)
        }
    }
}
