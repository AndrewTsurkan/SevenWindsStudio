import UIKit

final class MenuScreenPresenter {
    //MARK: - Private properties -
    private let view: MenuScreenViewInput
    private let interactor: MenuScreenInteractorInput
    private let router: MenuScreenRouterInput
    private let tokenKey = "tokenKey"
    
    var dataMenu: [MenuScreenEntity] = [] {
        didSet {
            view.reloadCollectionView()
        }
    }
    private let dataList: ListEntity
    
    init(view: MenuScreenViewInput,
         interactor: MenuScreenInteractorInput,
         router: MenuScreenRouterInput,
         dataList: ListEntity) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.dataList = dataList
    }
}

//MARK: - MenuScreenViewOutput -
extension MenuScreenPresenter: MenuScreenViewOutput {
    func downloadImage(url: String?, completion: @escaping (UIImage) -> Void) {
        var downloadedImage: UIImage? = nil
        self.interactor.getImage(urlString: url) { image in
            downloadedImage = image
            completion(downloadedImage ?? UIImage.placemarkIcon)
        }
    }
    
    func onViewDidLoad() {
        guard let id = dataList.id,
              let token = KeychainManager.shared.get(key: tokenKey)  else { return }
        interactor.getMenu(id: id, token: token)
    }
    
    func cellMinusButtonAction(cell: MenuScreenCollectionViewCell) {
        if cell.quantity > 0 {
            cell.quantity -= 1
        }
    }
    
    func cellPlusButtonAction(cell: MenuScreenCollectionViewCell) {
        cell.quantity += 1
    }
    
    func tapedButton() {
        router.openOrderScreen()
    }
}

//MARK: - MenuScreenInteractorOutput -
extension MenuScreenPresenter: MenuScreenInteractorOutput {
    
}
