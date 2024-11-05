import Foundation

fileprivate enum Constants {
    static let urlString: String = "http://147.78.66.203:3210/auth/register"
}

final class CreateAccountPresenter {
    private let interactor: CreateAccountInteractorInput
    private let router: CreateAccountRouterInput
    private let view: CreateAccountViewInput
    
    init(interactor: CreateAccountInteractorInput,
         router: CreateAccountRouterInput,
         view: CreateAccountViewInput) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

//MARK: - CreateAccountViewOutput
extension CreateAccountPresenter: CreateAccountViewOutput {
    func validateEmail(mail: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.(ru|com)$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: mail)
    }
    
    func validPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    func validRepeatPassword(password: String, repeatPassword: String) -> Bool {
        password == repeatPassword
    }
    
    func userSelectedCreateAccount(login: String, password: String) {
        interactor.createAccount(urlString: Constants.urlString, login: login, password: password)
    }
}

//MARK: - CreateAccountInteractorOutput -
extension CreateAccountPresenter: CreateAccountInteractorOutput {
    func didCreateAccount() {
        router.openAuthorizationScreen()
    }
        
    func showAlert() {
        view.showAlert(title: Localizable.alertTitle, message: Localizable.alertText)
    }
}
