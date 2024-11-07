import Foundation

final class AuthorizationRouter {
    weak var authorizationController: AuthorizationViewController?
}

//MARK: - Public -
extension AuthorizationRouter {
    func setViewController(viewController: AuthorizationViewController) {
        authorizationController = viewController
    }
}

//MARK: - AuthorizationRouterInput -
extension AuthorizationRouter: AuthorizationRouterInput {
    func openListScreen(token: String) {
        let listViewContoller = AssemblyListModule.assembleListViewConsroller(token: token)
        authorizationController?.navigationController?.pushViewController(listViewContoller, animated: true)
    }
    
    func openRegistretionScreen() {
        let registretionViewController = RegistrationAssembly.assembleRegistrationModule()
        authorizationController?.navigationController?.pushViewController(registretionViewController, animated: true)
    }
}
