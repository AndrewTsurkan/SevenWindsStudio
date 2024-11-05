import Foundation

final class CreateAccountRouter {
    weak var registrationViewController: CreateAccountViewController?
}

//MARK: - Public -
extension CreateAccountRouter {
    func setViewController(viewController: CreateAccountViewController) {
        registrationViewController = viewController
    }
}

//MARK: - CreateAccountRouterInput -
extension CreateAccountRouter: CreateAccountRouterInput {
    func openAuthorizationScreen() {
        let authVC = AuthorizationAssembly.assembleAuthorizationModule()
        registrationViewController?.navigationController?.pushViewController(authVC, animated: true)
    }
    
    
}
