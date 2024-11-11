import UIKit

final class MenuScreenPresenter {
    //MARK: - Private properties -
    weak var view: MenuScreenViewInput?
    private let interactor: MenuScreenInteractorInput
    private let router: MenuScreenRouterInput
    private let tokenKey = "tokenKey"
    private var orderData: [OrderData] = []
    
    var dataMenu: [MenuScreenEntity] = [] {
        didSet {
            view?.reloadCollectionView()
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
    
    func cellMinusButtonAction(quantity: inout Int, index: Int) -> Int {
        if quantity > 0 {
            quantity -= 1
            if let existingIndex = orderData.firstIndex(where: { $0.name == dataMenu[index].name }) {
                if quantity == 0 {
                    orderData.remove(at: existingIndex)
                } else {
                    orderData[existingIndex].quantity = quantity
                }
            }
        }
        return quantity
    }
    
    func cellPlusButtonAction(quantity: inout Int, index: Int) -> Int {
        quantity += 1
        
        if let existingIndex = orderData.firstIndex(where: { $0.name == dataMenu[index].name }) {
            orderData[existingIndex].quantity += 1
        } else {
            orderData.append(.init(name: dataMenu[index].name!,
                                   price: dataMenu[index].price!,
                                   quantity: quantity))
        }
        return quantity
    }
    
    func tapedButton() {
        router.openOrderScreen(orderData: orderData)
    }
}

//MARK: - MenuScreenInteractorOutput -
extension MenuScreenPresenter: MenuScreenInteractorOutput {
    
}

//MARK: - Private -
private extension MenuScreenPresenter {
    func saveData() {
        
    }
}
