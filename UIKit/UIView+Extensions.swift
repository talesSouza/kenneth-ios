import UIKit

extension UIView {
	
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
	
	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
			layer.masksToBounds = newValue > 0
		}
	}
	
	@IBInspectable var borderColor: UIColor {
		get {
			return UIColor.init(cgColor: layer.borderColor!)
		}
		set {
			layer.borderColor = newValue.cgColor
		}
	}
	
    func setShadow(shadowColor: UIColor = .gray,
				   shadowOpacity: Float = 0.5,
				   shadowRadius: CGFloat = 4,
				   shadowOffset: CGSize = CGSize(width: 0, height: 0)) {
		self.layer.shadowColor = shadowColor.cgColor
		self.layer.shadowOpacity = shadowOpacity
		self.layer.shadowRadius = shadowRadius
		self.layer.shadowOffset = shadowOffset
	}
}
