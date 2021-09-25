import UIKit

class TypeSelectionCardView: UIView, NibOwnerLoadable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabelView: LabelView!
    @IBOutlet weak var subtitleLabelView: LabelView!
    
    // MARK: - Actions
    var didTapAction: SimpleClosure = {}
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibContent()
    }
}

// MARK: - Setup
extension TypeSelectionCardView {
    
    func set(title: String) {
        titleLabelView.set(text: title, textStyle: TextStyle(color: .darkGray, size: .p18))
    }
    
    func set(subtitle: String) {
        subtitleLabelView.set(text: subtitle, textStyle: TextStyle(color: .lightGray, size: .p14))
        subtitleLabelView.isHidden = false
    }
    
    func set(didTapAction: @escaping SimpleClosure) {
        self.didTapAction = didTapAction
    }
}

// MARK: - IBActions
extension TypeSelectionCardView {
    
    @IBAction func didTapAction(_ sender: UIButton) {
        didTapAction()
    }
}

