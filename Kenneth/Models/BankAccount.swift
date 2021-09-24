import UIKit

enum AccountType {
    
    case checking
    case savings
}

struct BankAccount {
    
    let type: AccountType
    let name: String
    let agency: String
}
