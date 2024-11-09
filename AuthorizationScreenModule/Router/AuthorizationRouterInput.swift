import Foundation

protocol AuthorizationRouterInput: AnyObject {
    func openListScreen(token: String)
    func openRegistretionScreen()
}
