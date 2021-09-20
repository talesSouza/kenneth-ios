import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var centerLabelView: LabelView!
    @IBOutlet weak var startWithdrawButtonView: ButtonView!
}

// MARK: - Life Cycle
extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Setup
extension HomeViewController {
    
    private func setupLayout() {
        setupButtons()
        setupLabels()
        setNavigationBarLayout()
    }
    
    private func setupButtons() {
        startWithdrawButtonView.set(title: "home.startWithdraw".localized, style: .primary)
        startWithdrawButtonView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToPaymentType", sender: self)
        }
    }
    
    private func setupLabels() {
        centerLabelView.set(text: "home.description".localized, textStyle: TextStyle(color: .lightGray, weight: .light, aligment: .center))
    }
}
