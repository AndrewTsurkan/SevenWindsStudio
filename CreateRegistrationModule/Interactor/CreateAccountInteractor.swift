import Foundation

final class CreateAccountInteractor {
    //MARK: - Private propetries -
    private let networkManager = NetworkDataFetcher()
    weak var outPut: CreateAccountInteractorOutput?
}

//MARK: - Public -
extension CreateAccountInteractor {
    func setOutput(output: CreateAccountInteractorOutput) {
        self.outPut = output
    }
}
//MARK: - CreateAccountInteractorInput -
extension CreateAccountInteractor: CreateAccountInteractorInput {
    func createAccount(urlString: String, login: String, password: String) {
        networkManager.fetchJson(urlString: urlString, login: login, password: password) { [weak self] (result: Result<CreateAccountEntity, Error>) in
            guard let self else { return }
            switch result {
            case .success(let data):
                self.outPut?.didCreateAccount()
            case .failure(_):
                self.outPut?.showAlert()
            }
        }
    }
}
