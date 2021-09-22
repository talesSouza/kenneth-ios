import Foundation

class InfoFillingViewModel {
    
    // MARK: - Published Properties
    @Published var state: InfoFillingViewState = .started
    
    // MARK: - Stored Properties
    var name: String?
    var document: String?
}

// MARK: - Sets
extension InfoFillingViewModel {
    
    func set(name: String) {
        self.name = name
        state = .dataChanged
    }
    
    func set(document: String) {
        self.document = document
        state = .dataChanged
    }
}
