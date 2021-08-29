import UIKit

class TextBuilder {
    
    func buildText(text: String, style: TextStyle) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = style.aligment
        
        return NSMutableAttributedString(string: text,
                                         attributes: [NSAttributedString.Key.font: getSFProDisplay(withSize: style.size.rawValue, weight: style.weight),
                                                      NSAttributedString.Key.foregroundColor: style.color,
                                                      NSAttributedString.Key.underlineStyle: style.underlined,
                                                      NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
}

// MARK: - Private Methods
extension TextBuilder {
    private func getSFProDisplay(withSize size: CGFloat,
                                 weight: TextBuilderFontWeight) -> UIFont {
        let baseName = "SFProDisplay-"
        return UIFont(name: baseName + weight.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
