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
    func openListScreen() {
        
    }
}
