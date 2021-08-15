import UIKit

extension UILabel {
    
    func getLabelUnderlined(string: String) {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: string, attributes: underlineAttribute)
        self.attributedText = underlineAttributedString
    }
}
