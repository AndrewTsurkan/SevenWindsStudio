import Foundation

struct NetworkDataFetcher {
    private let networkService = NetworkService()
    
    func fetchJson<T: Codable>(urlString: String, login: String, password: String, closure: @escaping (Result<T, Error>) -> ()) {
        networkService.networkRequest(url: urlString, login: login, password: password) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    closure(.success(response))
                } catch let error {
                    closure(.failure(error))
                }
            case .failure(let error):
                closure(.failure(error))
            }
        }
    }
}
