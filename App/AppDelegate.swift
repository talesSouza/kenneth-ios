import UIKit
import IQKeyboardManagerSwift
import KeyValueStorage
import Resolver

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Dependencies
    @LazyInjected var storage: KeyValueStorageProtocol
    
    // MARK: - Stored Properties
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        setupAppDependencies()
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
    
    private func setupAppDependencies() {
        let appDependencies = AppDependencies()
        appDependencies.setup()
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
