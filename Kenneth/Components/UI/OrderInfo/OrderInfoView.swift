import UIKit

struct OrderInfo {
    
    let infoTitle: String
    let infoDesc1: String
    let infoDesc2: String
    let leadingIconImage: UIImage
}

class OrderInfoView: UIView, NibOwnerLoadable {
    
    // MARK: - IBOutlets
    @IBOutlet private var titleLabelView: LabelView!
    
    @IBOutlet private var InfoTitleLabelView: LabelView!
    @IBOutlet private var InfoDescLine1LabelView: LabelView!
    @IBOutlet private var InfoDescLine2LabelView: LabelView!
    @IBOutlet private var leadingIconImageView: UIImageView!
    @IBOutlet private var titleView: UIView!
    @IBOutlet private var filledInfoView: UIView!
    
    // MARK: - Stored Properties
    var orderInfo: OrderInfo?
    
    // MARK: - Actions
    var didTapAction: SimpleClosure = {}
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibContent()
    }
}

// MARK: - Setup
extension OrderInfoView {
    
    func set(title: String) {
        titleLabelView.set(text: title,
                           textStyle: TextStyle(color: .darkGray, size: .p16, aligment: .center))
    }
    
    func set(orderInfo: OrderInfo) {
        self.orderInfo = orderInfo
        setLayout()
    }
    
    func clear() {
        orderInfo = nil
        filledInfoView.isHidden = true
    }
    
    func set(didTapAction: @escaping SimpleClosure) {
        self.didTapAction = didTapAction
    }
}

// MARK: - Private Methods
extension OrderInfoView {
    
    func setLayout() {
        guard let orderInfo = orderInfo else { return }
        titleLabelView.set(text: orderInfo.infoTitle,
                           textStyle: TextStyle(color: .darkGray, size: .p16))
        InfoDescLine1LabelView.set(text: orderInfo.infoDesc1,
                                   textStyle: TextStyle(color: .lightGray, size: .p12))
        InfoDescLine2LabelView.set(text: orderInfo.infoDesc2,
                                   textStyle: TextStyle(color: .lightGray, size: .p12))
        leadingIconImageView.image = orderInfo.leadingIconImage
        filledInfoView.isHidden = false
    }
}

// MARK: - IBActions
extension OrderInfoView {
    
    @IBAction private func touchUpInside(_ sender: UIButton) {
        didTapAction()
    }
}
