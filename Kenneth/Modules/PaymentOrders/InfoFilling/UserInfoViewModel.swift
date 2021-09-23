import UIKit

class UserInfoViewModel {
    
    // MARK: - Published Properties
    @Published var state: UserInfoViewState = .started
    
    // MARK: - Stored Properties
    var user: User?
    //    var name: String?
    //    var document: String?
    
}

// MARK: - Sets
extension UserInfoViewModel {
    
    func set(name: String) {
        user?.name = name
        state = .dataChanged
    }
    
    func set(documentNumber: String) {
        user?.documentNumber = documentNumber
        state = .dataChanged
    }
    
    func set(photo: UIImage) {
        user?.photo = photo
        state = .dataChanged
    }
}
