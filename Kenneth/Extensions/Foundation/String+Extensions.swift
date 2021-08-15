//
//  String+Extensions.swift
//  Kenneth
//
//  Created by Bruno Moreira on 15/08/21.
//

import UIKit

extension String {
    
    func setUnderlined() -> NSAttributedString {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        return NSAttributedString(string: self, attributes: underlineAttribute)
    }
}
