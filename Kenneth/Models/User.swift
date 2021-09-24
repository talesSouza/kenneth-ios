import UIKit

struct User {
    
    let name: String
    let email: String
    var photo: UIImage?
    
    var orders: [PaymentOrder]
    
    var documents: [Document]
    var creditCards: [CreditCard]
    var bankAccounts: [BankAccount]
}
