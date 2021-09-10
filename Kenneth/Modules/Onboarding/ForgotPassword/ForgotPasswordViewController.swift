import UIKit

class ForgotPasswordViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var resetPasswordButtonView: ButtonView!
}

// MARK: - Life Cycle
extension ForgotPasswordViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
}

// MARK: - Private Methods
extension ForgotPasswordViewController {
    
    private func setupButtons() {
        
        resetPasswordButtonView.set(title: "forgotpassword.reset".localized, style: .primary)
        resetPasswordButtonView.isEnable(false)
        resetPasswordButtonView.set { [weak self] in
            guard let self = self else { return }
//            self.viewModel.login()
        }
    }
}
