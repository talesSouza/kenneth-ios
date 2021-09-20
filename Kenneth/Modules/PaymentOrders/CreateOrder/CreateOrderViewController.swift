import UIKit

class CreateOrderViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: CreateOrderViewModel = CreateOrderViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var paymentOrderNumberTextField: UITextField!
    @IBOutlet weak var tagTextField: UITextField!
    
    @IBOutlet weak var documentOrderInfoView: OrderInfoView!
    @IBOutlet weak var bankAccountOrderInfoView: OrderInfoView!
    @IBOutlet weak var creditCardOrderInfoView: OrderInfoView!
    
    @IBOutlet weak var nextButtonView: ButtonView!
}

// MARK: - Life Cycle
extension CreateOrderViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarLayout()
        setupLayout()
    }
}

// MARK: - Setup
extension CreateOrderViewController {
    
    private func setupLayout() {
        setupOrderInfos()
        setupButtons()
    }
    
    private func setupOrderInfos() {
        documentOrderInfoView.set(title: "createOrder.documentation".localized)
        documentOrderInfoView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "", sender: self)
        }
        
        bankAccountOrderInfoView.set(title: "createOrder.bankaccount".localized)
        bankAccountOrderInfoView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "", sender: self)
        }
        
        creditCardOrderInfoView.set(title: "createOrder.creditcard".localized)
        creditCardOrderInfoView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "", sender: self)
        }
    }
    
    private func setupButtons() {
        nextButtonView.set(title: "createOrder.next".localized, style: .primary)
    }
}

// MARK: - UITextFieldDelegate
extension CreateOrderViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text == paymentOrderNumberTextField.text {
            viewModel.set(paymentOrderNumber: text)
        } else if text == tagTextField.text {
            viewModel.set(tag: text)
        }
    }
}
