import UIKit

final class MapScreenViewController: UIViewController {
    var output: MapScreenViewOutput?
}

//MARK: - Public -
extension MapScreenViewController {
    func setOutput(output: MapScreenViewOutput) {
        self.output = output
    }
}

//MARK: - MapScreenViewInput -
extension MapScreenViewController: MapScreenViewInput {
    
}
