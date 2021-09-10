import UIKit

class LabelView: UIView, NibOwnerLoadable {
    
    // MARK: - IBOutlets
    @IBOutlet private var label: UILabel!
    
    // MARK: - Stored Properties
    private let textBuilder = TextBuilder()
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibContent()
    }
}

// MARK: - Public Methods
extension LabelView {
    
    func set(text: String, textStyle: LabelViewStyle = .primary) {
        label.attributedText = textBuilder.buildText(text: text, style: textStyle.textStyle)
    }
}
