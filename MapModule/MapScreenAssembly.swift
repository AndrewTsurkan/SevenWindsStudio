import UIKit

final class MapScreenAssembly {
    static func assembleMapScreen(cofeData: [ListEntity]) -> UIViewController {
        let view = MapScreenViewController()
        let interactor = MapScreenInteractor()
        let router = MapScreenRouter()
        let presenter = MapScreenPresenter(view: view,
                                           interactor: interactor,
                                           router: router,
                                           cofeData: cofeData)
        interactor.setOutput(output: presenter)
        view.setOutput(output: presenter)
        router.setViewController(view: view)
        return view
    }
}
