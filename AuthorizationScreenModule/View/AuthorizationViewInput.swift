import Foundation

protocol AuthorizationViewInput: AnyObject {
    var output: AuthorizationViewOutput? { get set }
    func showAlert(title: String, message: String)
}
