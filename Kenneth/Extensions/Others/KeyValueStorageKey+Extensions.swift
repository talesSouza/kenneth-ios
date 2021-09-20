import KeyValueStorage

extension KeyValueStorageKey {
    
    // MARK: - Onboarding
    static let didSeeTutorial = KeyValueStorageKey(type: .defaults, value: "didSeeTutorial")
    
    // MARK: - Session
    static let isLogged = KeyValueStorageKey(type: .keychain, value: "isLogged")
    static let userEmail = KeyValueStorageKey(type: .keychain, value: "userEmail")
    
    // MARK: - Home
    static let chosenPaymentType = KeyValueStorageKey(type: .memory, value: "chosenPaymentType")
}
