import Foundation
import Alamofire

struct NetworkService {
    
    enum APIError: Error {
        case unknown
        case invalidURL
        case invalidData
    }
    
    func networkRequest(complition: @escaping (Result<Data, Error>) -> ()) {
        let params: Parameters = [
            "login" : "qwasdasdqqqqqqqqqewewqвqqwe@mail.ru",
            "password" : "qwertyu"]
        
        let header = HTTPHeader(name: "Content-type", value: "application/json")
        AF.request("http://147.78.66.203:3210/auth/register", 
                   method: .post,
                   parameters: params,
                   headers: [header]).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    complition(.failure(error))
                }
                return
            }
            complition(.success(data))
        }
    }
}
