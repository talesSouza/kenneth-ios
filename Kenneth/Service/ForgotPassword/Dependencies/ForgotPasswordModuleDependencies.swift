import Foundation
import Resolver

class ForgotPasswordModuleDependencies {
    
    // MARK: - Stored Properties
    var resetPasswordService: ResetPasswordServiceProtocol?
    
    // MARK: - Initializers
    init(resetPasswordService: ResetPasswordServiceProtocol? = nil) {
        self.resetPasswordService = resetPasswordService
    }
}

// MARK: - ModuleDependencies
extension ForgotPasswordModuleDependencies: ModuleDependencies {
    
    func setupDependencies() {
        let resetPasswordService = self.resetPasswordService ?? ResetPasswordService()
        Resolver.register { resetPasswordService as ResetPasswordServiceProtocol }
    }
}
