import Foundation

final class AssemblyListModule {
    static func assembleListViewConsroller() -> ListViewController {
        let view = ListViewController()
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(view: view,
                                      interactor: interactor,
                                      router: router)
        view.setOutput(output: presenter)
        interactor.setOutput(output: presenter)
        return view
    }
}
