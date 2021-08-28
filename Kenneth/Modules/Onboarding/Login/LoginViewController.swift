import UIKit

class LoginViewController: UIViewController {

    // MARK: - Dependencies
    var viewModel: LoginViewModel = LoginViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
}

// MARK: - Life Cycle
extension LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
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
