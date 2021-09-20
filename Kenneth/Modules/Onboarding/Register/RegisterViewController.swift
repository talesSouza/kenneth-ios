import UIKit

class RegisterViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: RegisterViewModel = RegisterViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var registerButtonView: ButtonView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setObserver()
    }
}

// MARK: - View State
extension RegisterViewController {
    
    private func setObserver() {
        observe(viewModel.$state) { [weak self] state in
            guard let self = self else { return }
            self.changed(state: state)
        }
    }
    
    private func changed(state: RegisterViewState) {
        
        registerButtonView.isLoading(false)
        
        switch state {
        case .started:
            setupButtons()
        case .dataChanged:
            registerButtonView.isEnable(viewModel.isValidData)
        case .loading:
            registerButtonView.isLoading(true)
        case .registerFailed:
            showSimpleAlert(message: viewModel.requestMessage)
        case .registerSucceeded:
            goToRoot()
        }
    }
}

// MARK: - Private Methods
extension RegisterViewController {
    
    private func setupButtons() {
        registerButtonView.set(title: "register.register".localized, style: .primary)
        registerButtonView.isEnable(false)
        registerButtonView.set { [weak self] in
            guard let self = self else { return }
            self.viewModel.register()
        }
    }
    
    private func goToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        switch text {
        case nameTextField.text:
            viewModel.set(name: text)
        case emailTextField.text:
            viewModel.set(email: text)
        case passwordTextField.text:
            viewModel.set(password: text)
        case passwordConfirmTextField.text:
            viewModel.set(confirmPassword: text)
        default:
            print("error")
        }
    }
}

