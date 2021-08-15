import UIKit

extension UILabel {
    
    func getLabelUnderlined() {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        self.attributedText = underlineAttributedString
    }
}
