import Foundation

class RegisterService: RegisterServiceProtocol {
    
    func postRegister(name: String,
                      email: String,
                      password: String,
                      completion: @escaping ((Bool) -> Void)) {
        
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion(false)
        }
    }
}
