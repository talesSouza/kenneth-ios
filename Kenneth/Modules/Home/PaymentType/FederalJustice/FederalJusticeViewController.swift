import UIKit

class FederalJusticeViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var paymentOrderNumberTextField: UITextField!
    @IBOutlet weak var ticketTextField: UITextField!
    
    @IBOutlet weak var documentationLabelView: LabelView!
    @IBOutlet weak var bankAccountLabelView: LabelView!
    @IBOutlet weak var creditCardLabelView: LabelView!
    
    @IBOutlet var centralCardsView: [UIView]!
    
    @IBOutlet weak var nextButtonView: ButtonView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarLayout()
        setViews()
        setLabels()
        setButton()
    }
}

// MARK: - Setup
extension FederalJusticeViewController {
    
    private func setViews() {
        centralCardsView.forEach {
            //unica cor q encaixou
            $0.borderColor = .systemGray5
            $0.borderWidth = 1
        }
    }
    
    private func setLabels() {
        let text = TextStyle(color: .black, size: .p16, weight: .regular, aligment: .center)
        
        documentationLabelView.set(text: "federalJustice.documentation".localized, textStyle: text)
        bankAccountLabelView.set(text: "federalJustice.bankaccount".localized, textStyle: text)
        creditCardLabelView.set(text: "federalJustice.creditcard".localized, textStyle: text)
    }
    
    private func setButton() {
        nextButtonView.set(title: "federalJustice.next".localized, style: .primary)
    }
}
