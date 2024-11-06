import Foundation
fileprivate enum Constants {
    static let urlString = "http://147.78.66.203:3210/locations"
}
final class ListPresenter {
    //MARK: - Private properties -
    private let view: ListViewInput
    private let interactor: ListInteractorInput
    private let router: ListRouterInput
    
    var data: [ListEntity] = [] {
        didSet {
            view.reloadTAbleView()
            print(data)
        }
    }
    
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
    func onViewDidLoad() {
        interactor.getData(urlString: Constants.urlString)
    }
}

//MARK: - ListInteractorOutput -
extension ListPresenter: ListInteractorOutput {
    
}
