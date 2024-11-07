import UIKit

final class AuthorizationAssembly {
    static func assembleAuthorizationModule() -> UIViewController {
        let view = AuthorizationViewController()
        let interactor = AuthorizationInteractor()
        let router = AuthorizationRouter()
        let presenter = AuthorizationPresenter(interactor: interactor,
                                               view: view,
                                               router: router)
        interactor.setOutput(output: presenter)
        view.setOutput(output: presenter)
        router.setViewController(viewController: view)
        return view
    }
}
