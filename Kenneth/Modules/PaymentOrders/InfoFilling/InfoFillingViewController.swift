import UIKit

class InfoFillingViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabelView: LabelView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var documentTextField: UITextField!
    @IBOutlet weak var validateLabelView: LabelView!
    @IBOutlet weak var loadDocumentsButtonView: ButtonView!
}

// MARK: - Life Cycle
extension InfoFillingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarLayout()
        setupLayout()
    }
}

// MARK: - Setup
extension InfoFillingViewController {
    
    func setupLayout() {
        setLabels()
        setButtons()
        setTextFields()
    }
    
    func setTextFields() {
        nameTextField.backgroundColor = .grayLight
        documentTextField.backgroundColor = .grayLight
    }
    
    func setLabels() {
        titleLabelView.set(text: "infoFilling.title".localized, textStyle: TextStyle(color: .darkGray, size: .p20))
        validateLabelView.set(text: "infoFilling.validate".localized, textStyle: TextStyle(color: .systemGray2, size: .p16))
        validateLabelView.backgroundColor = .grayLight
    }
    
    func setButtons() {
        loadDocumentsButtonView.set(title: "infoFilling.loadDocuments".localized, style: .primary)
    }
}

// MARK: - UITextFieldDelegate
extension InfoFillingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            
        }
    }
}
