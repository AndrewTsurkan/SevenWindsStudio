import Foundation

protocol AuthorizationViewOutput: AnyObject {
    func userSelectedCreateAccount(login: String, password: String)
}
