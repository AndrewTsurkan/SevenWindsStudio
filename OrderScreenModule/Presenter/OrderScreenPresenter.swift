import UIKit

final class OrderScreenPresenter {
    //MARK: - Private properties -
    private let view: OrderSvreenViewInput
    private let interactor: OrderScreenInteractorInput
    private let router: OrderScreenRouterInput
    
    init(view: OrderSvreenViewInput,
         interactor: OrderScreenInteractorInput,
         router: OrderScreenRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

//MARK: - OrderScreenViewOutput -
extension OrderScreenPresenter: OrderScreenViewOutput {
    
}

//MARK: - OrderScreenInteractorOutput -
extension OrderScreenPresenter: OrderScreenInteractorOutput {
    
}
