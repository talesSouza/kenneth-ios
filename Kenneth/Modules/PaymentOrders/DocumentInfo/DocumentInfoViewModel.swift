import UIKit

class DocumentInfoViewModel {
    
    // MARK: - Published Properties
    @Published var state: DocumentInfoViewState = .started
    
    // MARK: - Stored Properties
    var selectedDocumentType: DocumentType
    var name: String?
    var number: String?
    var expirationDate: Date?
    var photo: UIImage?
    var document: Document?
    
    // MARK: - Initializers
    init(selectedDocumentType: DocumentType) {
        self.selectedDocumentType = selectedDocumentType
    }
}

// MARK: - Public Methods
extension DocumentInfoViewModel {
    
    func set(name: String) {
        self.name = name
        state = .dataChanged
    }
    
    func set(number: String) {
        self.number = number
        state = .dataChanged
    }
    
    func set(expirationDate: Date) {
        self.expirationDate = expirationDate
        state = .dataChanged
    }
    
    func set(photo: UIImage) {
        self.photo = photo
        state = .dataChanged
    }
    
    func createDocument() {
        guard let name = name,
              let number = number,
              let expirationDate = expirationDate,
              let photo = photo else { return }
        
        document = Document(type: selectedDocumentType,
                            name: name,
                            number: number,
                            expirationDate: expirationDate,
                            photo: photo)
        state = .documentCreated
    }
}
