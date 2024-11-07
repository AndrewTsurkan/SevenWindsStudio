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
    func openListScreen(token: String) {
        let authVC = AssemblyListModule.assembleListViewConsroller(token: token)
        registrationViewController?.navigationController?.pushViewController(authVC, animated: true)
    }    
}
