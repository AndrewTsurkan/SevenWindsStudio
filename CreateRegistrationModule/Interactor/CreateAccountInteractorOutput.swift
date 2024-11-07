import Foundation
protocol CreateAccountInteractorOutput:AnyObject {
    func didCreateAccount(token: String)
    func showAlert()
}
