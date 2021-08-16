import UIKit

extension String {
    
    func setUnderlined() -> NSAttributedString {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        return NSAttributedString(string: self, attributes: underlineAttribute)
    }
}
