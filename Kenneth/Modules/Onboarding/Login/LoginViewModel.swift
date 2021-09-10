import Foundation
import Combine

class LoginViewModel {
    
    // MARK: - Dependecies
    let service: LoginServiceProtocol
    
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
    
    // MARK: - Initializers
    init(service: LoginServiceProtocol = LoginService()) {
        self.service = service
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
            self.state = response ? .loginSucceeded : .loginFailed
        }
    }
}
