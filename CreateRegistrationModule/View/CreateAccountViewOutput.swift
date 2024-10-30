import Foundation
protocol CreateAccountViewOutput: AnyObject {
    func userSelectedCreateAccount(login: String, password: String)
}
