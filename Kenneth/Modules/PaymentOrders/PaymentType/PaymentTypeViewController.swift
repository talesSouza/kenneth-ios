import UIKit

class PaymentTypeViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var chooseTypeLabelView: LabelView!
    @IBOutlet weak var federalTypeSelectionCardView: TypeSelectionCardView!
    @IBOutlet weak var stateTypeSelectionCardView: TypeSelectionCardView!
    @IBOutlet weak var laborTypeSelectionCardView: TypeSelectionCardView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Setup
extension PaymentTypeViewController {
    
    private func setupLayout() {
        setLabels()
        setNavigationBarLayout()
        setActions()
    }
    
    private func setLabels() {
        
        chooseTypeLabelView.set(text: "paymentType.choosetype".localized, textStyle: TextStyle(color: .darkGray, size: .p24, weight: .regular, aligment: .center))
        
        federalTypeSelectionCardView.set(title: "paymentType.federal".localized)
        stateTypeSelectionCardView.set(title: "paymentType.state".localized)
        laborTypeSelectionCardView.set(title: "paymentType.labor".localized)
    }
    
    private func setActions() {
        federalTypeSelectionCardView.set { self.performSegue(withIdentifier: "goToCreateOrder", sender: .none) }
        stateTypeSelectionCardView.set { self.performSegue(withIdentifier: "goToCreateOrder", sender: .none) }
        laborTypeSelectionCardView.set { self.performSegue(withIdentifier: "goToCreateOrder", sender: .none) }
    }
}
