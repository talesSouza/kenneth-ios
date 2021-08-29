import UIKit

class LoginViewController: BaseViewController {

    // MARK: - Dependencies
    var viewModel: LoginViewModel = LoginViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonView: ButtonView!
    @IBOutlet weak var forgotPasswordButtonView: ButtonView!
}

// MARK: - Life Cycle
extension LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
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
        
        loginButtonView.isLoading(false)
        
        switch state {
        case .started:
            setupButtons()
        case .dataChanged:
            loginButtonView.isEnable(viewModel.isValidData)
        case .loading:
            loginButtonView.isLoading(true)
        case .loginFailed:
            showSimpleAlert(message: "Login falhou!")
        case .loginSucceeded:
            print("login succeeded")
        }
    }
}

// MARK: - Private Methods
extension LoginViewController {
    
    private func setupButtons() {
        
        loginButtonView.set(title: "ENTRAR", style: .primary)
        loginButtonView.isEnable(false)
        loginButtonView.set { [weak self] in
            guard let self = self else { return }
            self.viewModel.login()
        }
        
        forgotPasswordButtonView.set(title: "Esqueci minha senha", style: .underlined)
        forgotPasswordButtonView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToForgotPassword", sender: self)
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
