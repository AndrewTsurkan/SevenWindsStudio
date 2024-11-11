import UIKit
import Alamofire

struct NetworkService {
    //MARK: - POST -
    func networkPOSTRequest(url: String, login: String, password: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let params: [String: String] = [
            "login": login,
            "password": password
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    //MARK: - GET -
    func networkGETRequest(url: String, token: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                let image = UIImage(data: data)
                completion(image)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
