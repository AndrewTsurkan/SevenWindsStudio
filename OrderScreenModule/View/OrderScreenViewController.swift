import UIKit

final class OrderScreenViewController: UIViewController {
    var output: OrderScreenViewOutput?
}
//MARK: - Public -
extension OrderScreenViewController {
    func setOutput(output: OrderScreenViewOutput) {
        self.output = output
    }
}

//MARK: - OrderScreenViewInput -
extension OrderScreenViewController: OrderSvreenViewInput {
    
}
