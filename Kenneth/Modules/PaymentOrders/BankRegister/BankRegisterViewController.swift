import UIKit

class BankRegisterViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: BankRegisterModelView = BankRegisterModelView()
    
    // MARK: - Outlets
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var agencyTextField: UITextField!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var digitTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var bankNameLabelView: LabelView!
    @IBOutlet weak var registerButtonView: ButtonView!
}

// MARK: - Life Cycle
extension BankRegisterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        setObserver()
    }
}

// MARK: - View State
extension BankRegisterViewController {
    
    func setObserver() {
        observe(viewModel.$state) { [weak self] state in
            guard let self = self else { return }
            self.changed(state: state)
        }
    }
    
    private func changed(state: BankRegisterViewState) {
        
        switch state {
        case .started:
            break
        case .dataChanged:
            break
        case .loading:
            break
        }
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
        bankNameLabelView.set(text: "bankRegister.bank".localized, textStyle: TextStyle(color: .gray, size: .p14))
    }
    
    private func setButtonViews() {
        registerButtonView.set(title: "bankRegister.register".localized, style: .primary)
    }
}

// MARK: - IBActions
extension BankRegisterViewController {
    @IBAction func goToBankOptions(_ sender: UIButton) {
        performSegue(withIdentifier: "goToBankOptions", sender: self)
    }
    
}

// MARK: - UITextFieldDelegate
extension BankRegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch text {
        case tagTextField.text:
            viewModel.set(tag: text)
        case agencyTextField.text:
            viewModel.set(agency: text)
        case accountTextField.text:
            viewModel.set(account: text)
        case digitTextField.text:
            viewModel.set(digit: text)
        case cpfTextField.text:
            viewModel.set(cpf: text)
        default:
            print("error")
        }
    }
}
