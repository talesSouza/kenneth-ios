import UIKit

class OnboardingViewController: UIViewController {
    
}

// MARK: - Life Cycle
extension OnboardingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        setNavigationBarLayout()
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
