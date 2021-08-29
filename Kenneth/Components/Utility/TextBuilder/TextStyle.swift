import UIKit

enum TextBuilderFontSize: CGFloat {
    case p14 = 14
    case p12 = 12
}

enum TextBuilderFontWeight: String {
    case bold = "Bold"
    case light = "Light"
    case regular = "Regular"
    case semibold = "Semibold"
}

struct TextStyle {
    var color: UIColor = .gold
    var size: TextBuilderFontSize = .p14
    var weight: TextBuilderFontWeight = .regular
    var aligment: NSTextAlignment = .left
    var underlined: Bool = false
}
