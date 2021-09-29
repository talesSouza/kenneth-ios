import UIKit

enum DocumentType: String {
    
    case rg = "RG"
    case cnh = "CPF"
    case oab = "OAB"
    
    var description: String {
        switch self {
        case .rg:
            return "documentType.rg".localized
        case .cnh:
            return "documentType.cnh".localized
        case .oab:
            return "documentType.oab".localized
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
