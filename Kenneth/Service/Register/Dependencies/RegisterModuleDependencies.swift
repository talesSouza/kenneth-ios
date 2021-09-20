import Foundation
import Resolver

class RegisterModuleDependencies {
    
    // MARK: - Stored Properties
    var registerService: RegisterServiceProtocol?
    
    // MARK: - Initializers
    init(registerService: RegisterServiceProtocol? = nil) {
        self.registerService = registerService
    }
}

// MARK: - ModuleDependencies
extension RegisterModuleDependencies: ModuleDependencies {
    
    func setupDependencies() {
        let registerService = self.registerService ?? RegisterService()
        Resolver.register { registerService as RegisterServiceProtocol }
    }
}
