import UIKit
import IQKeyboardManagerSwift
import KeyValueStorage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let storage: KeyValueStorageProtocol = KeyValueStorage()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        setInitialViewController()
        
        return true
    }
}

// MARK: - Setup
extension AppDelegate {
    
    private func setupWindow(rootViewController: UIViewController) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
    }
}

// MARK: - Launch
extension AppDelegate {
    
    private func setInitialViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let navigation = storyboard.instantiateInitialViewController() as? UINavigationController else { return }
        var rootViewController: UIViewController
        
        if let isLogged: Bool = storage.get(key: .isLogged), isLogged {
            rootViewController = storyboard.instantiateViewController(withIdentifier: "homeViewController")
        } else if let didSeeTutorial: Bool = storage.get(key: .didSeeTutorial), didSeeTutorial {
            rootViewController = storyboard.instantiateViewController(withIdentifier: "onboardingViewController")
        } else {
            rootViewController = storyboard.instantiateViewController(withIdentifier: "sliderViewController")
        }
        
        navigation.viewControllers = [rootViewController]
        setupWindow(rootViewController: navigation)
    }
}
