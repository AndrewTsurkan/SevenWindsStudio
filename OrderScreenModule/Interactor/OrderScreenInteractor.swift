import Foundation

final class OrderScreenInteractor {
    weak var output: OrderScreenInteractorOutput?
}
//MARK: - Public -
extension OrderScreenInteractor {
    func setOutput(output: OrderScreenInteractorOutput) {
        self.output = output
    }
}

//MARK: - OrderScreenIteractorInput -
extension OrderScreenInteractor: OrderScreenInteractorInput {
    
}
