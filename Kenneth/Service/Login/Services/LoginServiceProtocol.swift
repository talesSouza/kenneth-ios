import Foundation

protocol LoginServiceProtocol {
    func postLogin(email: String, password: String, completion: @escaping ((Bool) -> Void))
}
