import UIKit

final class MapScreenAssembly {
    static func assembleMapScreen() -> UIViewController {
        let view = MapScreenViewController()
        let interactor = MapScreenInteractor()
        let router = MapScreenRouter()
        let presenter = MapScreenPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        interactor.setOutput(output: presenter)
        view.setOutput(output: presenter)
        router.setViewController(view: view)
        return view
    }
}
