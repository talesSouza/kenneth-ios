import Foundation

protocol PaymentOrderProtocol {
    func postPaymentOrder(number: Double, ticket: Double, completion: @escaping ((Bool) -> Void))
}
