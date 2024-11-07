import Foundation
protocol CreateAccountInteractorInput: AnyObject {
    var outPut: CreateAccountInteractorOutput? { get set }
    func createAccount(urlString: String, login: String, password: String)
}
