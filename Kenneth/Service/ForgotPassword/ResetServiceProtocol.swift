import Foundation

protocol ResetPasswordServiceProtocol {
    func postResetPassword(email: String, completion: @escaping ((Bool) -> Void))
}
