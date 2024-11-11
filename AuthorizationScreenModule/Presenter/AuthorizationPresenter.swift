import Foundation

fileprivate enum Constants {
    static let urlString: String = "http://147.78.66.203:3210/auth/login"
}

final class AuthorizationPresenter {
    //MARK: - Private properties -
    private let interactor: AuthorizationInteractorInput
    weak var view: AuthorizationViewInput?
    private let router: AuthorizationRouterInput
    
    init(interactor: AuthorizationInteractor,
         view: AuthorizationViewController,
         router: AuthorizationRouter) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
}

//MARK: - AuthorizationViewOutput -
extension AuthorizationPresenter: AuthorizationViewOutput {
    func userSelectedEnterInAccount(login: String, password: String) {
        interactor.enterInAccount(urlString: Constants.urlString, login: login, password: password)
    }
    
    func userSelectedCreateAccount() {
        router.openRegistretionScreen()
    }
}

//MARK: - AuthorizationInteractorOutput -
extension AuthorizationPresenter: AuthorizationInteractorOutput {
    func showAlert() {
        view?.showAlert(title: Localizable.alertTitle, message: Localizable.alertTextAuthotorization)
    }
    
    func showListViewController(token: String) {
        router.openListScreen(token: token)
    }
    
    
}
