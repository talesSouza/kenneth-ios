import UIKit

class BankRegisterViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var agencyTextField: UITextField!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var digitTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var bankLabelView: LabelView!
    @IBOutlet weak var registerButtonView: ButtonView!
    
}

// MARK: - Life Cycle
extension BankRegisterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension BankRegisterViewController {
    
    private func setup() {
        setNavigationBarLayout()
        setLabelViews()
        setButtonViews()
    }
    
    private func setLabelViews() {
        bankLabelView.set(text: "bankRegister.bank".localized, textStyle: TextStyle(color: .gray, size: .p14))
    }
    
    private func setButtonViews() {
        registerButtonView.set(title: "bankRegister.register".localized, style: .primary)
    }
}
