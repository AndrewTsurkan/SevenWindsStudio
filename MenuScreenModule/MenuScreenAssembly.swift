import UIKit

final class MenuScreenAssembly {
    static func assembleMenuScreen(dataList: ListEntity) -> UIViewController {
        let view = MenuScreenViewController()
        let interactor = MenuScreenInteractor()
        let router = MenuScreenRouter()
        
        let presenter = MenuScreenPresenter(view: view,
                                            interactor: interactor,
                                            router: router,
                                            dataList: dataList)
        
        view.setOutput(output: presenter)
        interactor.setoutput(output: presenter)
        router.setViewController(viewController: view)
        return view
    }
}
