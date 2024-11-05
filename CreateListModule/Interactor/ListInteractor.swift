import Foundation

final class ListInteractor {
    var outPut: ListInteractorOutput?
}

//MARK: - Public -
extension ListInteractor {
   func setOutput(_ output: ListInteractorOutput) {
        self.outPut = output
    }
}

//MARK: - ListInteractorInput -
extension ListInteractor: ListInteractorInput {
    
}
