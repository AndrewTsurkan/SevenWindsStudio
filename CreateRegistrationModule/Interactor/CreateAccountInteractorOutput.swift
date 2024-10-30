import Foundation
protocol CreateAccountInteractorOutput:AnyObject {
    func didReceive(error: String)
    func dedCreateAccount(login: String) 
}
