import UIKit

class PaymentTypeViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var chooseTypeLabelView: LabelView!
    @IBOutlet weak var federalLabelView: LabelView!
    @IBOutlet weak var stateLabelView: LabelView!
    @IBOutlet weak var laborLabelView: LabelView!
    @IBOutlet var cardsView: [UIView]!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setLabels()
        setNavigationBarLayout()
    }
}

// MARK: - Setup
extension PaymentTypeViewController {
    
    private func setViews() {
        cardsView.forEach {
            //unica cor q encaixou
            $0.borderColor = .systemGray5
            $0.borderWidth = 1
        }
    }
    
    private func setLabels() {
        let text = TextStyle(color: .darkGray, size: .p18, weight: .regular, aligment: .center)
        
        chooseTypeLabelView.set(text: "paymenttype.choosetype".localized, textStyle: TextStyle(color: .darkGray, size: .p24, weight: .regular, aligment: .center))
        
        federalLabelView.set(text: "paymenttype.federal".localized, textStyle: text)
        
        stateLabelView.set(text: "paymenttype.state".localized, textStyle: text)
        
        laborLabelView.set(text: "paymenttype.labor".localized, textStyle: text)
    }
}
