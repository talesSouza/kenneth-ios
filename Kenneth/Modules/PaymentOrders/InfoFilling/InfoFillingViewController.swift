import UIKit

class InfoFillingViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: InfoFillingViewModel = InfoFillingViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabelView: LabelView!
    @IBOutlet weak var photoImageView: UIImageView!
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
            if text == nameTextField.text {
                viewModel.set(name: text)
            } else if text == documentTextField.text {
                viewModel.set(document: text)
            }
        }
    }
}

// MARK: - IBActions
extension InfoFillingViewController {
    @IBAction func loadPhotoTouchUpInside(_ sender: UIButton) {
        let alert = UIAlertController(title: "selecionar foto", message: "de onde você quer a foto?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Câmera", style: .default, handler: { (action) in
                self.selectPicture(sourceType: .camera)
            })
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default, handler: { (action) in
            self.selectPicture(sourceType: .photoLibrary)
        })
        alert.addAction(libraryAction)
        
        let photosAction = UIAlertAction(title: "Album de fotos", style: .default, handler: { (action) in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        })
        alert.addAction(photosAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
   
}

// MARK: - UIPicker
extension InfoFillingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let originalWidth = image.size.width
            let aspectRatio = originalWidth / image.size.height
            
            var smallSize: CGSize
            if aspectRatio > 1 {
//                smallSize = CGSize(width: 140, height: 120/aspectRatio)
                smallSize = CGSize(width: 140, height: 140)
            } else {
//                smallSize = CGSize(width: 120*aspectRatio, height: 120)
                smallSize = CGSize(width: 140, height: 140)
            }
            
            UIGraphicsBeginImageContext(smallSize)
            image.draw(in: CGRect(x: 0, y: 0, width: smallSize.width, height: smallSize.height))
            let smallImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            dismiss(animated: true) { [self] in
                photoImageView.image = smallImage
            }
        }
    }
}
