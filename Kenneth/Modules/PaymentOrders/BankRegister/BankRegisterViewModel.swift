import UIKit

class BankRegisterModelView {
    
    // MARK: - Published Properties
    @Published var state: BankRegisterViewState = .started
    
    // MARK: - Stored Properties
    var bankName: String?
    var tag: String?
    var agency: String?
    var account: String?
    var digit: String?
    var cpf: String?
}

// MARK: - Sets
extension BankRegisterModelView {
    
    func set(bankName: String?) {
        self.bankName = bankName
    }
    
    func set(tag: String?) {
        self.tag = tag
    }
    
    func set(agency: String?) {
        self.agency = agency
    }
    
    func set(account: String?) {
        self.account = account
    }
    
    func set(digit: String?) {
        self.digit = digit
    }
    
    func set(cpf: String?) {
        self.cpf = cpf
    }
    
    
}
