import Foundation
import Combine
import Resolver
import KeyValueStorage

class SliderViewModel {
    
    // MARK: - Dependencies
    @LazyInjected var storage: KeyValueStorageProtocol
    
    // MARK: - Published Properties
    @Published var state: SliderViewState = .started
}

// MARK: - Public Methods
extension SliderViewModel {
    
    func setFinishedTutorial() {
        storage.set(value: true, for: .didSeeTutorial)
        state = .finishedSlider
    }
}
