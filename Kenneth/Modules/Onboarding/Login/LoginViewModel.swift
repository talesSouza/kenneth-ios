import Foundation
import Combine
import Resolver
import KeyValueStorage

class LoginViewModel {
    
    // MARK: - Dependecies
    @LazyInjected var service: LoginServiceProtocol
    @LazyInjected var storage: KeyValueStorageProtocol
    
    // MARK: Published Properties
    @Published var state: LoginViewState = .started
    
    // MARK: - Stored Properties
    private var email: String?
    private var password: String?
    
    // MARK: - Computed Properties
    var isValidData: Bool {
        guard let email = email, let password = password else { return false }
        return !email.isEmpty && !password.isEmpty
    }
}

// MARK: - Sets
extension LoginViewModel {
    
    func set(email: String) {
        self.email = email
        state = .dataChanged
    }
    
    func set(password: String) {
        self.password = password
        state = .dataChanged
    }
}

// MARK: - Service
extension LoginViewModel {
    
    func login() {
        guard let email = email, let password = password else { return }
        state = .loading
        service.postLogin(email: email, password: password) { response in
            if response {
                self.storage.set(value: true, for: .isLogged)
                self.storage.set(value: email, for: .userEmail)
                self.state = .loginSucceeded
            } else {
                self.state = .loginFailed
            }
        }
    }
}
