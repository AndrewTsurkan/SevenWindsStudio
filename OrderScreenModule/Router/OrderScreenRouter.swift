import UIKit

final class OrderScreenRouter {
    weak var orderScreenViewController: OrderScreenViewController?
}
//MARK: - Public -
extension OrderScreenRouter {
    func setViewController(viewController: OrderScreenViewController) {
        orderScreenViewController = viewController
    }
}
//MARK: - OrderScreenRouterInput -
extension OrderScreenRouter: OrderScreenRouterInput {
    
}
