import Foundation
import Combine
import Resolver

class ForgotPasswordViewModel {
    
    // MARK: - Dependecies
    @LazyInjected var service: ResetPasswordServiceProtocol
    
    // MARK: Published Properties
    @Published var state: ForgotPasswordViewState = .started
    
    // MARK: - Stored Properties
    private var email: String?
    
    // MARK: - Computed Properties
    var isValidData: Bool {
        guard let email = email else { return false }
        return !email.isEmpty
    }
}

// MARK: - Sets
extension ForgotPasswordViewModel {
    
    func set(email: String) {
        self.email = email
        state = .dataChanged
    }
}

// MARK: - Service
extension ForgotPasswordViewModel {
    
    func login() {
        guard let email = email else { return }
        state = .loading
        service.postResetPassword(email: email) { response in
            self.state = response ? .resetSucceeded : .resetFailed
        }
    }
}


