import UIKit

final class OrderScreenAssembly {
    static func assembleOrderScreen() -> UIViewController {
        let view = OrderScreenViewController()
        let interactor = OrderScreenInteractor()
        let router = OrderScreenRouter()
        let presenter = OrderScreenPresenter(view: view,
                                             interactor: interactor,
                                             router: router)
        view.setOutput(output: presenter)
        interactor.setOutput(output: presenter)
        router.setViewController(viewController: view)
        return view
    }
}
