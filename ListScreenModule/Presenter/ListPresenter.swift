import Foundation
fileprivate enum Constants {
    static let urlString = "http://147.78.66.203:3210/locations"
}
final class ListPresenter {
    //MARK: - Private properties -
    private let view: ListViewInput
    private let interactor: ListInteractorInput
    private let router: ListRouterInput
    private let locationManager = LocationManager()
    private let tokenKey = "tokenKey"
    
    var data: [ListEntity] = [] {
        didSet {
            view.reloadTAbleView()
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
        guard let token = KeychainManager.shared.get(key: tokenKey) else { return }
        interactor.getData(urlString: Constants.urlString, token: token)
    }
    
    func showMap() {
        router.openMap(cofeData: data)
    }
    
    func showMenuScreen(index: Int) {
        let dataList = data[index]
        router.openMenuScreen(dataList: dataList)
    }
}

//MARK: - ListInteractorOutput -
extension ListPresenter: ListInteractorOutput {
    
}

//MARK: - Private -
extension ListPresenter {
    func culculetedDistance(index: Int) -> Double {
        var distance: Double = 0
        locationManager.getCurrentLocation(completion: { [weak self] location in
            guard let location,
            let self else { return }
            let currentLatitude = location.coordinate.latitude
            let currentLongitude = location.coordinate.longitude
            guard let targetLatitudeString = self.data[index].point?.latitude,
                    let targetLongitudeString = self.data[index].point?.longitude,
                    let targetLatitude = Double(targetLatitudeString),
                    let targetLongitude = Double(targetLongitudeString) else { return }
            
            distance = self.locationManager.calculateDistance(from: currentLatitude, longitude1: currentLongitude, to: targetLatitude, longitude2: targetLongitude)
        })
        return distance
    }
}
