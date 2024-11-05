import Foundation

final class ListPresenter {
    //MARK: - Private properties -
    private let view: ListViewInput
    private let interactor: ListInteractorInput
    private let router: ListRouterInput
    
    init(view: ListViewInput,
         interactor: ListInteractorInput,
         router:ListRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

//MARK: - ListViewOutput -
extension ListPresenter: ListViewOutput {
    
}

//MARK: - ListInteractorOutput -
extension ListPresenter: ListInteractorOutput {
    
}
