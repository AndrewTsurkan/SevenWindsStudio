import Foundation

final class ListInteractor {
    //MARK: - Private properties -
    private let networkManager = NetworkDataFetcher()
    var outPut: ListInteractorOutput?
}

//MARK: - Public -
extension ListInteractor {
   func setOutput(output: ListInteractorOutput) {
        self.outPut = output
    }
}

//MARK: - ListInteractorInput -
extension ListInteractor: ListInteractorInput {
    func getData(urlString: String) {
        networkManager.fetchJson(urlString: urlString) { [weak self] (result: Result<[ListEntity], Error>) in
            switch result {
            case .success(let data):
                self?.outPut?.data = data 
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
