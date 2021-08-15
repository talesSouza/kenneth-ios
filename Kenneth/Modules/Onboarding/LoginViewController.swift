import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

// MARK: - Local Methods
extension LoginViewController {
    func setLayout() {
        forgotPasswordLabel.getLabelUnderlined()
    }
}
