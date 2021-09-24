import UIKit

class CreateOrderViewModel {
    
    // MARK: Published Properties
    @Published var state: CreateOrderViewState = .started
    
    // MARK: - Stored Properties
    var paymentOrderNumber: String?
    var tag: String?
    var document: Document?
    var creditCard: CreditCard?
    var bankAccount: BankAccount?
    
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
