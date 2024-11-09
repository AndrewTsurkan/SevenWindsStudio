import Foundation
protocol CreateAccountViewInput: AnyObject {
    var output: CreateAccountViewOutput? { get set }
    func showAlert(title: String, message: String)
}
