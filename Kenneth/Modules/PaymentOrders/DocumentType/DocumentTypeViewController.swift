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
    }
    
    private func setLabels() {
        titleLabelView.set(text: "documentType.title".localized, textStyle: TextStyle(color: .darkGray, size: .p22))
        subtitleLabelView.set(text: "documentType.subtitle".localized, textStyle: TextStyle(color: .lightGray, size: .p16))
        
        RGTypeSelectionCardView.set(title: "documentType.titleID".localized)
        RGTypeSelectionCardView.set(subtitle: "documentType.subtitleID".localized)
        RGTypeSelectionCardView.set {
            self.performSegue(withIdentifier: "goToDocumentInfo", sender: self)
        }
        
        CNHTypeSelectionCardView.set(title: "documentType.titleDriver".localized)
        CNHTypeSelectionCardView.set(subtitle: "documentType.subtitleDriver".localized)
        CNHTypeSelectionCardView.set {
            self.performSegue(withIdentifier: "goToDocumentInfo", sender: self)
        }
        
        OABTypeSelectionCardView.set(title: "documentType.titleLawyer".localized)
        OABTypeSelectionCardView.set(subtitle: "documentType.subtitleLawyer".localized)
        OABTypeSelectionCardView.set {
            self.performSegue(withIdentifier: "goToDocumentInfo", sender: self)
        }
}
}


