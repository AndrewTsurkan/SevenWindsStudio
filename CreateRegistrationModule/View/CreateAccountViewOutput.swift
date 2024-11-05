import Foundation
protocol CreateAccountViewOutput: AnyObject {
    func userSelectedCreateAccount(login: String, password: String)
    func validateEmail(mail: String) -> Bool
    func validPassword(password: String) -> Bool
    func validRepeatPassword(password: String, repeatPassword: String) -> Bool
}
