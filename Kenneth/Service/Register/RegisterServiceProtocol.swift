import Foundation

protocol RegisterServiceProtocol {
    func postRegister(name: String, email: String, password: String, completion: @escaping ((Bool) -> Void))
}
