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
        
        var request = try! URLRequest(url: url, method: .post)
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
    
    func networkGETRequest(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJBdXRoZW50aWNhdGlvbiIsImlzcyI6ImNvZmZlZSBiYWNrZW5kIiwiaWQiOjE2NjMsImV4cCI6MTczMDg4NDIyMH0.HRRvYXuV5i3XeKHZJcxPGgEjC5R2unMfIOHBSVbZq3c", forHTTPHeaderField: "Authorization")
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
