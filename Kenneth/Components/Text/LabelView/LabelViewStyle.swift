import UIKit

enum LabelViewStyle {
    
    case primary
    case secondary
    
    var textStyle: TextStyle {
        switch self {
        case .primary:
            return TextStyle(color: .gold, size: .p14, weight: .bold, aligment: .center, underlined: false)
        case .secondary:
            return TextStyle(color: .grayLight, size: .p12, weight: .regular, aligment: .center, underlined: false)
        }
    }
}

