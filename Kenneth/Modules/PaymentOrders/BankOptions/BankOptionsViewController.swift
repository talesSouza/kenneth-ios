import UIKit

class BankOptionsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var banksTableView: UITableView!    
    
    // MARK: - Stored Properties
    //onde colocar os nomes E como passar pra tela anterior no dismiss
    let bankName: [String] = ["Banco do Brasil", "Banrisul", "Itau", "Santander", "Bradesco", "Caixa Federal"]
}

// MARK: - Life Cycle
extension BankOptionsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarLayout()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension BankOptionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankName.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = banksTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BankOptionsTableViewCell
        let bankName = bankName[indexPath.row]
        cell.setLabels(text: bankName)
        
        return cell
    }
}
