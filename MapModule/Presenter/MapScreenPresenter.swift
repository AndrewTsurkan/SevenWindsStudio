import Foundation

final class MapScreenPresenter {
    //MARK: - Private properties -
    private let view: MapScreenViewInput
    private let interactor: MapScreenInteractorInput
    private let router: MapScreenRouterInput
    
    init(view: MapScreenViewInput,
         interactor: MapScreenInteractorInput,
         router: MapScreenRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
}

//MARK: - MapScreenInteractorOutput
extension MapScreenPresenter: MapScreenInteractorOutput {
    
}

//MARK: - MapScreenViewOutput
extension MapScreenPresenter: MapScreenViewOutput {
    
}
