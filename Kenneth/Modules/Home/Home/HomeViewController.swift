import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var centerLabelView: LabelView!
    @IBOutlet weak var startWithdrawButtonView: ButtonView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupLabels()
        setNavigationBarLayout()
    }
}


// MARK: - Setup
extension HomeViewController {
    
    private func setupButtons() {
        startWithdrawButtonView.set(title: "home.startWithdraw".localized, style: .primary)
        startWithdrawButtonView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToPaymentType", sender: self)
        }
    }
    
    private func setupLabels() {
        centerLabelView.set(text: "home.description".localized, textStyle: TextStyle(color: .lightGray, size: .p14, weight: .light, aligment: .center))
    }
}
