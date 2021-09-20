import Foundation
import Resolver
import KeyValueStorage

class CoreModuleDependencies: ModuleDependencies {
    
    func setupDependencies() {
        let storage = KeyValueStorage()
        Resolver.register { storage as KeyValueStorageProtocol }
    }
}
