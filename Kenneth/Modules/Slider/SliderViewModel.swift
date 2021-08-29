import Foundation
import Combine
import KeyValueStorage

class SliderViewModel {
    
    // MARK: - Dependencies
    let storage: KeyValueStorageProtocol
    
    // MARK: - Published Properties
    @Published var state: SliderViewState = .started
    
    // MARK: - Initializers
    init(storage: KeyValueStorageProtocol = KeyValueStorage()) {
        self.storage = storage
    }
}

// MARK: - Public Methods
extension SliderViewModel {
    
    func setFinishedTutorial() {
        storage.set(value: true, for: .didSeeTutorial)
        state = .finishedSlider
    }
}
