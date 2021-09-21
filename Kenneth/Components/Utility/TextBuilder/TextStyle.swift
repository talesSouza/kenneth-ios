import UIKit

enum TextBuilderFontSize: CGFloat {
    case p24 = 24
    case p22 = 22
    case p20 = 20
    case p18 = 18
    case p16 = 16
    case p14 = 14
    case p12 = 12
    case p10 = 10
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
    var aligment: NSTextAlignment = .center
    var underlined: Bool = false
}
