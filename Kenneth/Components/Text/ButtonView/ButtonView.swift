import UIKit

class ButtonView: UIView, NibOwnerLoadable {
    
    // MARK: - IBOutlets
    @IBOutlet private var button: UIButton!
    @IBOutlet private var loader: UIActivityIndicatorView!
    
    // MARK: - Stored Properties
    private let textBuilder = TextBuilder()
    
    // MARK: - Actions
    private var onTapAction: SimpleClosure = {}
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibContent()
    }
}

// MARK: - Public Methods
extension ButtonView {
    
    func set(title: String, style: ButtonViewStyle) {
        button.setAttributedTitle(textBuilder.buildText(text: title, style: style.textStyle), for: .normal)
        backgroundColor = style.backgroundColor
    }
    
    func set(onTapAction: @escaping SimpleClosure) {
        self.onTapAction = onTapAction
    }
    
    func isEnable(_ enable: Bool) {
        alpha = enable ? 1 : 0.5
        button.isEnabled = enable
    }
    
    func isLoading(_ loading: Bool) {
        loader.isHidden = !loading
        button.isHidden = loading
    }
}

// MARK: - IBActions
extension ButtonView {
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        onTapAction()
    }
}
