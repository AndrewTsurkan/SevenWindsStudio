import Foundation

protocol AuthorizationInteractorInput: AnyObject {
    var outPut: AuthorizationInteractorOutput? { get set }
    func enterInAccount(urlString: String, login: String, password: String) 
}
