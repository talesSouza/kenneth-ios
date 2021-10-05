import UIKit

class BankOptionsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var banksLabelView: LabelView!
}

// MARK: - Sets
extension BankOptionsTableViewCell {
    func setLabels(text: String) {
        banksLabelView.set(text: text, textStyle: TextStyle(color: .black,
                                                            size: .p18,
                                                            aligment: .center))
    }
}
