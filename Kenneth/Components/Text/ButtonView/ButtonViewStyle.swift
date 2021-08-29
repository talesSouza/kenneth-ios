import UIKit

enum ButtonViewStyle {
    case primary
    case secondary
    case underlined
    
    var textStyle: TextStyle {
        switch self {
        case .underlined:
            return TextStyle(color: .gray, size: .p12, aligment: .center)
        default:
            return TextStyle(color: .white, weight: .semibold, aligment: .center)
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return .gold
        case .secondary:
            return .black
        case .underlined:
            return .clear
        }
    }
}




