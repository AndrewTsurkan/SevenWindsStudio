import Foundation

final class AssemblyListModule {
    static func assembleListViewConsroller(token: String) -> ListViewController {
        let view = ListViewController()
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(view: view,
                                      interactor: interactor,
                                      router: router, token: token)
        view.setOutput(output: presenter)
        interactor.setOutput(output: presenter)
        router.listScreenViewController = view
        return view
    }
}
