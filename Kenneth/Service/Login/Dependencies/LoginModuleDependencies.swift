import Foundation
import Resolver

class LoginModuleDependencies {
    
    // MARK: - Stored Properties
    var loginService: LoginServiceProtocol?
    
    // MARK: - Initializers
    init(loginService: LoginServiceProtocol? = nil) {
        self.loginService = loginService
    }
}

// MARK: - ModuleDependencies
extension LoginModuleDependencies: ModuleDependencies {
    
    func setupDependencies() {
        let loginService = self.loginService ?? LoginService()
        Resolver.register { loginService as LoginServiceProtocol }
    }
}
