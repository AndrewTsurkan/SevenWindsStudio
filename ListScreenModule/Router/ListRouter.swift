import Foundation

final class ListRouter {
    weak var listScreenViewController: ListViewController?
}

//MARK: - ListRouterInput -
extension ListRouter: ListRouterInput {
    func openMenuScreen(dataList: ListEntity) {
        let menuScreenViewController = MenuScreenAssembly.assembleMenuScreen(dataList: dataList)
        listScreenViewController?.navigationController?.pushViewController(menuScreenViewController, animated: true)
        
    }
    
    func openMap(cofeData: [ListEntity]) {
        let mapScreenViewController = MapScreenAssembly.assembleMapScreen(cofeData: cofeData)
        listScreenViewController?.navigationController?.pushViewController(mapScreenViewController, animated: true)
        
    }
    
    
}

