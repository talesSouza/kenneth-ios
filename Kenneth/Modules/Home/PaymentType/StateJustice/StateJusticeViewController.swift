import UIKit

class StateJusticeViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: StateJusticeViewModel = StateJusticeViewModel()
    
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
extension StateJusticeViewController {
    
    private func setViews() {
        centralCardsView.forEach {
            $0.borderColor = .grayLight
            $0.borderWidth = 1
        }
    }
    
    private func setLabels() {
        let text = TextStyle(color: .black, size: .p16, weight: .regular, aligment: .center)
        
        documentationLabelView.set(text: "statejustice.documentation".localized, textStyle: text)
        bankAccountLabelView.set(text: "statejustice.bankaccount".localized, textStyle: text)
        creditCardLabelView.set(text: "statejustice.creditcard".localized, textStyle: text)
    }
    
    private func setButton() {
        nextButtonView.set(title: "statejustice.next".localized, style: .primary)
    }
}
