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
        
        RGTypeSelectionCardView.set(title: "documentType.titleID".localized, subtitle: "documentType.subtitleID".localized)
        CNHTypeSelectionCardView.set(title: "documentType.titleDriver".localized, subtitle: "documentType.subtitleDriver".localized)
        OABTypeSelectionCardView.set(title: "documentType.titleLawyer".localized, subtitle: "documentType.subtitleLawyer".localized)
        
    }
    
    private func setActions() {
        RGTypeSelectionCardView.set { self.performSegue(withIdentifier: "goToDocumentInfo", sender: self) }
        CNHTypeSelectionCardView.set { self.performSegue(withIdentifier: "goToDocumentInfo", sender: self) }
        OABTypeSelectionCardView.set { self.performSegue(withIdentifier: "goToDocumentInfo", sender: self) }
    }
}


