import Foundation
protocol CreateAccountInteractorInput: AnyObject {
    var outPut: CreateAccountInteractorOutput { get }
    func createAccount(login: String, pasword: String)
}
