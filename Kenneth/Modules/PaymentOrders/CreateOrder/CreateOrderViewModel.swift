import UIKit

class CreateOrderViewModel {
    
    // MARK: Published Properties
    @Published var state: CreateOrderViewState = .started
    
    // MARK: - Stored Properties
    private var paymentOrderNumber: String?
    private var tag: String?
    
    // MARK: - Computed Properties
    var isValidData: Bool {
        return true
    }
}

// MARK: - Sets
extension CreateOrderViewModel {
    
    func set(paymentOrderNumber: String) {
        self.paymentOrderNumber = paymentOrderNumber
        state = .dataChanged
    }
    
    func set(tag: String) {
        self.tag = tag
        state = .dataChanged
    }
}
