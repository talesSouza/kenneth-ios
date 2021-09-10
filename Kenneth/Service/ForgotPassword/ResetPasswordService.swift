import Foundation

class ResetPasswordService: ResetPasswordServiceProtocol {
    
    func postResetPassword(email: String,
                           completion: @escaping ((Bool) -> Void)) {
        
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion(false)
        }
    }
}
