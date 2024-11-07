import Foundation

final class MapScreenInteractor {
    weak var output: MapScreenInteractorOutput?
}

//MARK: - Public -
extension MapScreenInteractor {
    func setOutput(output: MapScreenInteractorOutput) {
        self.output = output
    }
}

//MARK: MapInteractorInput
extension MapScreenInteractor: MapScreenInteractorInput {
    
}
