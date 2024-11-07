import Foundation
import Alamofire

struct NetworkService {
    
    enum APIError: Error {
        case unknown
        case invalidURL
        case invalidData
    }
 //MARK: - POST -
    func networkPOSTRequest(url: String, login: String, password: String, completion: @escaping (Result<Data, Error>) -> ()) {
        let params: [String: String] = ["login": login, "password": password]
        guard let url = URL(string: url) else { return }
        
        guard var request = try? URLRequest(url: url, method: .post) else { return }
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpBody = try? JSONEncoder().encode(params)
        AF.request(request).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(data))
        }
    }
    
    //MARK: - GET -
    
    func networkGETRequest(url: String, token: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        AF.request(request).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(data))
        }
    }
}
