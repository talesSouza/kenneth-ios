import UIKit

class UserInfoViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: UserInfoViewModel = UserInfoViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabelView: LabelView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var documentTextField: UITextField!
    @IBOutlet weak var validateLabelView: LabelView!
    @IBOutlet weak var loadDocumentsButtonView: ButtonView!
}

// MARK: - Life Cycle
extension UserInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarLayout()
        setupLayout()
    }
}

// MARK: - Setup
extension UserInfoViewController {
    
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

// MARK: - Private Methods
extension UserInfoViewController {
    
    // MARK: - openPhotoOptions Method
    private func openPhotoOptions() {
        let alert = UIAlertController(title: "infoFilling.selectPhoto".localized, message: "infoFilling.wichPhoto".localized, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            // MARK: - Camera
            let cameraAction = UIAlertAction(title: "infoFilling.camera".localized, style: .default, handler: { (action) in
                self.selectPicture(sourceType: .camera)
            })
            alert.addAction(cameraAction)
        }
        
        // MARK: - Photos Library
        let libraryAction = UIAlertAction(title: "infoFilling.photoLibrary".localized, style: .default, handler: { (action) in
            self.selectPicture(sourceType: .photoLibrary)
        })
        alert.addAction(libraryAction)
        
        // MARK: - Photos Album
        let photosAction = UIAlertAction(title: "infoFilling.photoAlbum".localized, style: .default, handler: { (action) in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        })
        alert.addAction(photosAction)
        
        // MARK: - Cancel
        let cancelAction = UIAlertAction(title: "infoFilling.cancel".localized, style: .default, handler: nil)
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

// MARK: - IBActions
extension UserInfoViewController {
    @IBAction func loadPhotoTouchUpInside(_ sender: UIButton) {
        openPhotoOptions()
    }
}

// MARK: - UITextFieldDelegate
extension UserInfoViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if text == nameTextField.text {
                viewModel.set(name: text)
            } else if text == documentTextField.text {
                viewModel.set(documentNumber: text)
            }
        }
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension UserInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let smallSize = CGSize(width: 140, height: 144)
            UIGraphicsBeginImageContext(smallSize)
            image.draw(in: CGRect(x: 0, y: 0, width: smallSize.width, height: smallSize.height))
            let smallImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            if let smallImage = smallImage {
                dismiss(animated: true) { [self] in
                    viewModel.set(photo: smallImage)
                    photoImageView.image = smallImage
                }
            }
        }
    }
}
