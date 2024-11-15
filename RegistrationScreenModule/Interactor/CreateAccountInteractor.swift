import Foundation

final class CreateAccountInteractor {
    //MARK: - Private propetries -
    private let networkManager = NetworkDataFetcher()
    private let tokenKey = "tokenKey"
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
                guard let token = data.token else { return }
                KeychainManager.shared.save(value: token, key: tokenKey)
                self.outPut?.didCreateAccount(token: token)
            case .failure(_):
                self.outPut?.showAlert()
            }
        }
    }
}
