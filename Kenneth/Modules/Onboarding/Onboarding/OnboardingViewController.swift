import UIKit

class OnboardingViewController: UIViewController {
    
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
        loginButtonView.set(title: "ENTRAR", style: .primary)
        loginButtonView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToLogin", sender: self)
        }
        registerButtonView.set(title: "CADASTRAR", style: .secondary)
        registerButtonView.set { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "goToRegister", sender: self)
        }
    }
}

// MARK: - Private Methods
extension OnboardingViewController {
    func setNavigationBarLayout() {
        if let text = UIFont(name: "SFProDisplay-Light", size: 20),
           let thisNavigation = self.navigationController {
            thisNavigation.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: text,
                NSAttributedString.Key.foregroundColor: UIColor.gold]
            
            let yourBackImage = UIImage(named: "arrow")
            thisNavigation.navigationBar.backIndicatorImage = yourBackImage
            thisNavigation.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
            thisNavigation.navigationBar.backItem?.title = ""
        }
    }
}
