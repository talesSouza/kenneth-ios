import UIKit

class OnboardingViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var loginButtonView: ButtonView!
    @IBOutlet private var registerButtonView: ButtonView!
}

// MARK: - Life Cycle
extension OnboardingViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        setNavigationBarLayout()
    }
}

// MARK: - Setup
extension OnboardingViewController {
    
    private func setupButtons() {
        loginButtonView.set(title: "onboarding.enter".localized, style: .primary)
        loginButtonView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToLogin", sender: self)
        }
        registerButtonView.set(title: "onboarding.register".localized, style: .secondary)
        registerButtonView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToRegister", sender: self)
        }
    }
}

