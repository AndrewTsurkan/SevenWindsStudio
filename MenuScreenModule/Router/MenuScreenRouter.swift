import Foundation

final class MenuScreenRouter {
    weak var menuScreenViewController: MenuScreenViewController?
}

//MARK: - Public -
extension MenuScreenRouter {
    func setViewController(viewController: MenuScreenViewController) {
        menuScreenViewController = viewController
    }
}

//MARK: - MenuScreenRouterInput -
extension MenuScreenRouter: MenuScreenRouterInput {
    func openOrderScreen(orderData: [OrderData]) {
        let orderScreenViewController = OrderScreenAssembly.assembleOrderScreen(orderData: orderData)
        menuScreenViewController?.navigationController?.pushViewController(orderScreenViewController, animated: true)
    }
}
