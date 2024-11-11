import UIKit

final class OrderScreenPresenter {
    //MARK: - Private properties -
    weak var view: OrderSvreenViewInput?
    private let interactor: OrderScreenInteractorInput
    private let router: OrderScreenRouterInput
    private var orderData: [OrderData]
    
    init(view: OrderSvreenViewInput,
         interactor: OrderScreenInteractorInput,
         router: OrderScreenRouterInput,
         orderData: [OrderData]) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.orderData = orderData
    }
}

//MARK: - OrderScreenViewOutput -
extension OrderScreenPresenter: OrderScreenViewOutput {
    func minusButtonTapped(index: Int) {
        if orderData[index].quantity > 0 {
            orderData[index].quantity -= 1
            if orderData[index].quantity == 0 {
                orderData.remove(at: index)
            }
        }
    }
    
    func plusButtonTapped(index: Int) {
        orderData[index].quantity += 1
    }
    
    func cellCount() -> Int {
        orderData.count
    }
    
    func cellData(index: Int) -> OrderData {
        orderData[index]
    }
}

//MARK: - OrderScreenInteractorOutput -
extension OrderScreenPresenter: OrderScreenInteractorOutput { }
