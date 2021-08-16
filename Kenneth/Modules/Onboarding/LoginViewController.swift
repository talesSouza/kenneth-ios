import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Life Cycle
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
    }
}
