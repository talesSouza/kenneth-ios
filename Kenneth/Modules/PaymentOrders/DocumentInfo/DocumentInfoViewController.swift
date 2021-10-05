import UIKit

class DocumentInfoViewController: BaseViewController {
    
    // MARK: - Dependencies
    let viewModel: DocumentInfoViewModel = DocumentInfoViewModel(selectedDocumentType: .rg)
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabelView: LabelView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var documentTextField: UITextField!
    @IBOutlet weak var validateTextField: UITextField!
    @IBOutlet weak var loadDocumentsButtonView: ButtonView!
    
    let datePicker = UIDatePicker()
}

// MARK: - Life Cycle
extension DocumentInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setObserver()
        setNavigationBarLayout()
        createDatePicker()
    }
}

// MARK: - View State
extension DocumentInfoViewController {
    
    private func setObserver() {
        observe(viewModel.$state) { [weak self] state in
            guard let self = self else { return }
            self.changed(state: state)
        }
    }
    
    private func changed(state: DocumentInfoViewState) {
        
        switch state {
        case .started:
            setupLayout()
        case .documentCreated:
            guard let document = viewModel.document else { return }
            //Momento de passar o document para createOrderViewModel
        default:
            break
        }
    }
}

// MARK: - Setup
extension DocumentInfoViewController {
    
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
        titleLabelView.set(text: "documentInfo.title".localized, textStyle: TextStyle(color: .darkGray, size: .p20))
    }
    
    func setButtons() {
        loadDocumentsButtonView.set(title: "documentInfo.loadDocuments".localized, style: .primary)
        loadDocumentsButtonView.set { [weak self] in
            guard let self = self else { return }
            self.viewModel.createDocument()
        }
    }
}

extension DocumentInfoViewController {
    
    private func createDatePicker() {
        validateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        //ajustar pra abrir direto o calendario
        
        //aqui mudar o texto qdo apertado done (ver pod usado)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
//        validateTextField.text = dateFormatter.string(from: datePicker.date)
        
    }
    
    
}

// MARK: - IBActions
extension DocumentInfoViewController {
    @IBAction func loadPhotoTouchUpInside(_ sender: UIButton) {
        openPhotoOptions()
    }
}

// MARK: - UITextFieldDelegate
extension DocumentInfoViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if text == nameTextField.text {
                viewModel.set(name: text)
            } else if text == documentTextField.text {
                viewModel.set(number: text)
            }
        }
    }
}

// MARK: - Photo Selection
extension DocumentInfoViewController {
    
    private func openPhotoOptions() {
        
        let alert = UIAlertController(title: "documentInfo.selectPhoto".localized,
                                      message: "documentInfo.wichPhoto".localized,
                                      preferredStyle: .actionSheet)
        
        // Camera Action
        if let cameraAction = createCameraAction() {
            alert.addAction(cameraAction)
        }
        
        // Photos Library Action
        let libraryAction = UIAlertAction(title: "documentInfo.photoLibrary".localized,
                                          style: .default,
                                          handler: { (action) in
                                            self.selectPicture(sourceType: .photoLibrary)
                                          })
        alert.addAction(libraryAction)
        
        // Cancel Action
        let cancelAction = UIAlertAction(title: "documentInfo.cancel".localized,
                                         style: .default,
                                         handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func createCameraAction() -> UIAlertAction? {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return UIAlertAction(title: "documentInfo.camera".localized,
                                 style: .default,
                                 handler: { (action) in
                                    self.selectPicture(sourceType: .camera)
                                 })
        } else {
            return nil
        }
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension DocumentInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
