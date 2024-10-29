import Foundation

final class CreateAccountInteractor {
    
}

//MARK: - CreateAccountInteractorInput -
extension CreateAccountInteractor: CreateAccountInteractorInput {
    var outPut: any CreateAccountInteractorOutput {
        
    }
    
    func createAccount(login: String, pasword: String) {
        
    }
    
}
//MARK: - CreateAccountInteractorOutput -
extension CreateAccountInteractor: CreateAccountInteractorOutput {
    func didReceive(error: String) {
        
    }
    
    func dedCreateAccount(login: String) {
        
    }
    
    
}
