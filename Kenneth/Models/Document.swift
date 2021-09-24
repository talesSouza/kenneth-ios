import UIKit

enum DocumentType: String {
    
    case rg = "RG"
    case cpf = "CPF"
    case oab = "OAB"
    
    // TODO: arrumar
    var description: String {
        switch self {
        case .rg:
            return "documentType.rg".localized
        case .cpf:
            return "rg".localized
        case .oab:
            return "rg".localized
        }
    }
}

struct Document {
    
    let type: DocumentType
    let name: String
    let number: String
    let expirationDate: Date
    let photo: UIImage
}
