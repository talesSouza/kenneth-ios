import UIKit

class PaymentTypeViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var chooseTypeLabelView: LabelView!
    @IBOutlet weak var federalLabelView: LabelView!
    @IBOutlet weak var stateLabelView: LabelView!
    @IBOutlet weak var laborLabelView: LabelView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        setNavigationBarLayout()
    }
}

// MARK: - Setup
extension PaymentTypeViewController {
    
    
    private func setLabels() {
        let text = TextStyle(color: .darkGray, size: .p18, weight: .regular, aligment: .center)
        
        chooseTypeLabelView.set(text: "paymentType.choosetype".localized, textStyle: TextStyle(color: .darkGray, size: .p24, weight: .regular, aligment: .center))
        federalLabelView.set(text: "paymentType.federal".localized, textStyle: text)
        stateLabelView.set(text: "paymentType.state".localized, textStyle: text)
        laborLabelView.set(text: "paymentType.labor".localized, textStyle: text)
    }
}

// MARK: - IBActions
extension PaymentTypeViewController {
    @IBAction func createOrderTouchUpInside(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCreateOrder", sender: .none)
    }
}
