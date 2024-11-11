import Foundation
protocol AuthorizationInteractorOutput: AnyObject {
    func showListViewController(token: String)
    func showAlert()
}
