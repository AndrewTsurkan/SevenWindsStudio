import UIKit

final class RegistrationAssembly {
    static func assembleRegistrationModule() -> UIViewController {
        let view = CreateAccountViewController()
        let interactor = CreateAccountInteractor()
        let router = CreateAccountRouter()
        let presenter = CreateAccountPresenter(interactor: interactor,
                                               router: router,
                                               view: view)
        interactor.setOutput(output: presenter)
        view.setOutput(output: presenter)
        router.setViewController(viewController: view)
        return view
    }
}
