import Foundation

class PaymentOrderService: PaymentOrderProtocol {
    func postPaymentOrder(number: Double, ticket: Double, completion: @escaping ((Bool) -> Void)) {
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion(true)
        }
    }
}
