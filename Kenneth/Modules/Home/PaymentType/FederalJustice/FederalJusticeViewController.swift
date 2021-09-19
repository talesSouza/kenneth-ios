import UIKit

class FederalJusticeViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: FederalJusticeViewModel = FederalJusticeViewModel()
    
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
            $0.borderColor = .grayLight
            $0.borderWidth = 1
        }
    }
    
    private func setLabels() {
        let text = TextStyle(color: .black, size: .p16, weight: .regular, aligment: .center)
        
        documentationLabelView.set(text: "federaljustice.documentation".localized, textStyle: text)
        bankAccountLabelView.set(text: "federaljustice.bankaccount".localized, textStyle: text)
        creditCardLabelView.set(text: "federaljustice.creditcard".localized, textStyle: text)
    }
    
    private func setButton() {
        nextButtonView.set(title: "federaljustice.next".localized, style: .primary)
    }
}
