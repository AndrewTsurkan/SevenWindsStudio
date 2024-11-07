import Foundation

final class MapScreenRouter  {
    weak var mapScreenViewController: MapScreenViewController?
}

//MARK: - MapScreenRouterInput -

extension MapScreenRouter {
    func setViewController(view: MapScreenViewController) {
        mapScreenViewController = view
    }
}

//MARK: - MapScreenRouterInput -
extension MapScreenRouter: MapScreenRouterInput {
    func openMenuScreen() {
        
    }
}
