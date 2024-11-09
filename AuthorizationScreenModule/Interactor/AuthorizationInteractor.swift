import Foundation

final class AuthorizationInteractor {
    //MARK: - Private properties -
    private let networkManager = NetworkDataFetcher()
    weak var outPut: AuthorizationInteractorOutput?
    private let tokenKey = "tokenKey"
    
}
//MARK: - AuthorizationInteractorInput -
extension AuthorizationInteractor: AuthorizationInteractorInput {
    func enterInAccount(urlString: String, login: String, password: String) {
        networkManager.fetchJson(urlString: urlString, login: login, password: password) { [weak self] (result: Result<CreateAccountEntity, Error>) in
            guard let self else { return }
            switch result {
            case .success(let data):
                guard let token = data.token else { return }
                KeychainManager.shared.save(value: token, key: tokenKey)
                outPut?.showListViewController(token: token)
            case .failure(_):
                self.outPut?.showAlert()
            }
        }
    }
}

//MARK: - Public -
extension AuthorizationInteractor {
    func setOutput(output: AuthorizationInteractorOutput) {
        self.outPut = output
    }
}
