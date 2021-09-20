import Foundation

class AppDependencies {
    
    func setup(dependencies: [ModuleDependencies]? = nil) {
        
        let dependencies = dependencies ?? [CoreModuleDependencies(),
                                            LoginModuleDependencies(),
                                            ForgotPasswordModuleDependencies(),
                                            RegisterModuleDependencies()]
        
        for module in dependencies {
            module.setupDependencies()
        }
    }
}
