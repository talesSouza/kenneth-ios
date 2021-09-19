import UIKit

class StateJusticeViewModel {
    
    // MARK: - Dependencies
    let service: PaymentOrderProtocol
    
    // MARK: Published Properties
    @Published var state: StateJusticeViewState = .started
    
    // MARK: - Stored Properties
    private var paymentOrderNumber: Double?
    private var ticket: Double?
    
    // MARK: - Computed Properties
    var isValidData: Bool {
        guard let paymentOrderNumber = paymentOrderNumber else { return false }
        //AQUI ARRUMAR
        return !paymentOrderNumber.isZero
    }
    
    // MARK: - Initializers
    init(service: PaymentOrderProtocol = PaymentOrderService()) {
        self.service = service
    }
}

// MARK: - Sets
extension StateJusticeViewModel {
    
    func set(paymentOrderNumber: Double) {
        self.paymentOrderNumber = paymentOrderNumber
        state = .dataChanged
    }
    
    func set(ticket: Double) {
        self.ticket = ticket
        state = .dataChanged
    }
}

// MARK: - Service
extension StateJusticeViewModel {
    
    func goNext() {
        guard let paymentOrderNumber = paymentOrderNumber else { return }
        state = .loading
        if let ticket = ticket {
            service.postPaymentOrder(number: paymentOrderNumber, ticket: ticket) { response in
                self.state = response ? .loginSucceeded : .loginFailed }
        }
    }
}
