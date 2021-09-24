import UIKit

class DocumentTypeViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabelView: LabelView!
    @IBOutlet weak var subtitleLabelView: LabelView!
    
    // TODO: arrumar nomes
    @IBOutlet weak var topTitleLabelView: LabelView!
    @IBOutlet weak var topSubtitleLabelView: LabelView!
    @IBOutlet weak var centerTitleLabelView: LabelView!
    @IBOutlet weak var centerSubtitleLabelView: LabelView!
    @IBOutlet weak var bottomTitleLabelView: LabelView!
    @IBOutlet weak var bottomSubtitleLabelView: LabelView!
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
        let titleTextStyle = TextStyle(color: .darkGray, size: .p18)
        let subtitleTextStyle = TextStyle(color: .lightGray, size: .p12)
        
        // TODO: atualizar nome modulo localized
        titleLabelView.set(text: "documentsRegistration.title".localized, textStyle: TextStyle(color: .darkGray, size: .p22))
        subtitleLabelView.set(text: "documentsRegistration.subtitle".localized, textStyle: TextStyle(color: .lightGray, size: .p16))
        
        topTitleLabelView.set(text: "documentsRegistration.titleID".localized, textStyle: titleTextStyle)
        topSubtitleLabelView.set(text: "documentsRegistration.subtitleID".localized, textStyle: subtitleTextStyle)
        
        centerTitleLabelView.set(text: "documentsRegistration.titleDriver".localized, textStyle: titleTextStyle)
        centerSubtitleLabelView.set(text: "documentsRegistration.subtitleDriver".localized, textStyle: subtitleTextStyle)
        
        bottomTitleLabelView.set(text: "documentsRegistration.titleLawyer".localized, textStyle: titleTextStyle)
        bottomSubtitleLabelView.set(text: "documentsRegistration.subtitleLawyer".localized, textStyle: subtitleTextStyle)
    }
}

// MARK: - IBActions
extension DocumentTypeViewController {
    @IBAction func documentType(_ sender: UIButton) {
        performSegue(withIdentifier: "goToInfosFilling", sender: self)
    }
}
