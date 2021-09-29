import UIKit

class DocumentTypeViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabelView: LabelView!
    @IBOutlet weak var subtitleLabelView: LabelView!
    
    @IBOutlet weak var RGTypeSelectionCardView: TypeSelectionCardView!
    @IBOutlet weak var CNHTypeSelectionCardView: TypeSelectionCardView!
    @IBOutlet weak var OABTypeSelectionCardView: TypeSelectionCardView!
}

// MARK: - Life Cycle
extension DocumentTypeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Private Methods
extension DocumentTypeViewController {
    private func setupLayout() {
        setNavigationBarLayout()
        setLabels()
        setActions()
    }
    
    private func setLabels() {
        titleLabelView.set(text: "documentType.title".localized, textStyle: TextStyle(color: .darkGray, size: .p22))
        subtitleLabelView.set(text: "documentType.subtitle".localized, textStyle: TextStyle(color: .lightGray, size: .p16))
        
        RGTypeSelectionCardView.set(title: DocumentType.rg.rawValue, subtitle: DocumentType.rg.description)
        CNHTypeSelectionCardView.set(title: DocumentType.cnh.rawValue, subtitle: DocumentType.cnh.description)
        OABTypeSelectionCardView.set(title: DocumentType.oab.rawValue, subtitle: DocumentType.oab.description)
        
    }
    
    private func setActions() {
        let typeSelectionCardViews: [TypeSelectionCardView] = [RGTypeSelectionCardView, CNHTypeSelectionCardView, OABTypeSelectionCardView]
        typeSelectionCardViews.forEach { $0.set { self.performSegue(withIdentifier: "goToDocumentInfo", sender: self) 
        }
        }
    }
}
