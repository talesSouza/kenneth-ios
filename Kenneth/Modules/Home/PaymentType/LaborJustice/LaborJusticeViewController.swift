//import UIKit
//
//class LaborJusticeViewController: BaseViewController {
//    
//    // MARK: - Dependencies
//    let viewModel: LaborJusticeViewModel = LaborJusticeViewModel()
//    
//    // MARK: - IBOutlets
//    
//    
//    // MARK: - Life Cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setNavigationBarLayout()
//        setViews()
//        setLabels()
//        setButton()
//    }
//}
//
//// MARK: - Setup
//extension LaborJusticeViewController {
//    
//    private func setViews() {
//        centralCardsView.forEach {
//            $0.borderColor = .grayLight
//            $0.borderWidth = 1
//        }
//    }
//    
//    private func setLabels() {
//        let text = TextStyle(color: .black, size: .p16, weight: .regular, aligment: .center)
//        
//        documentationLabelView.set(text: "laborjustice.documentation".localized, textStyle: text)
//        bankAccountLabelView.set(text: "laborjustice.bankaccount".localized, textStyle: text)
//        creditCardLabelView.set(text: "laborjustice.creditcard".localized, textStyle: text)
//    }
//    
//    private func setButton() {
//        nextButtonView.set(title: "laborjustice.next".localized, style: .primary)
//    }
//}
