import Foundation

protocol AuthorizationViewOutput: AnyObject {
    func userSelectedEnterInAccount(login: String, password: String)
    func userSelectedCreateAccount()
}
