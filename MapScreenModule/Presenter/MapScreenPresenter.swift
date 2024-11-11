import UIKit
import MapKit

final class MapScreenPresenter {
    //MARK: - Private properties -
    private let view: MapScreenViewInput
    private let interactor: MapScreenInteractorInput
    private let router: MapScreenRouterInput
    private let cofeData: [ListEntity]
    
    init(view: MapScreenViewInput,
         interactor: MapScreenInteractorInput,
         router: MapScreenRouterInput,
         cofeData: [ListEntity]) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.cofeData = cofeData
    }
}

//MARK: - MapScreenInteractorOutput
extension MapScreenPresenter: MapScreenInteractorOutput {
    
}

//MARK: - MapScreenViewOutput
extension MapScreenPresenter: MapScreenViewOutput {
    func onViewDidLoad() {
        setupMarkCode()
    }
}

//MARK: - Private -
extension MapScreenPresenter {
    func setupMarkCode() {
        cofeData.forEach { view.addPlacemark(data: $0)}
    }
}
