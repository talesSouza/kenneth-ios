import Foundation
import Combine

class ForgotPasswordViewModel {
    
    // MARK: - Dependecies
    let service: ResetPasswordServiceProtocol
    
    // MARK: Published Properties
    @Published var state: ForgotPasswordViewState = .started
    
    // MARK: - Stored Properties
    private var email: String?
    
    // MARK: - Computed Properties
    var isValidData: Bool {
        guard let email = email else { return false }
        return !email.isEmpty
    }
    
    // MARK: - Initializers
    init(service: ResetPasswordServiceProtocol = ResetPasswordService()) {
        self.service = service
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


