import Foundation
import Combine
import Resolver

class RegisterViewModel {
    
    // MARK: - Dependencies
    @LazyInjected var service: RegisterServiceProtocol
    
    // MARK: - Published Properties
    @Published var state: RegisterViewState = .started
    
    // MARK: - Stored Properties
    private var name: String?
    private var email: String?
    private var password: String?
    private var passwordConfirm: String?
    var requestMessage = ""
    
    // MARK: - Computed Properties
    var isValidData: Bool {
        guard let name = name,
              let email = email,
              let password = password,
              let confirmPassword = passwordConfirm else { return false }
        return !name.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
}

// MARK: - Sets
extension RegisterViewModel {
    
    func set(name: String) {
        self.name = name
        state = .dataChanged
    }
    
    func set(email: String) {
        self.email = email
        state = .dataChanged
    }
    
    func set(password: String) {
        self.password = password
        state = .dataChanged
    }
    
    func set(confirmPassword: String) {
        self.passwordConfirm = confirmPassword
        state = .dataChanged
    }
}

// MARK: - Service
extension RegisterViewModel {
    
    func register() {
        guard let name = name,
              let email = email,
              let password = password,
              let confirmPassword = passwordConfirm else { return }
        state = .loading
        
        if password != confirmPassword {
            requestMessage = "Passwords doesn't match"
            state = .registerFailed
            return
        }
        
        service.postRegister(name: name, email: email, password: password) { response in
            self.state = response ? .registerSucceeded : .registerFailed
        }
    }
}
