import UIKit

final class CreateAccountViewController: UIViewController {
    //MARK: - Private properties -
    private let contentView = CreateAccountContentView()
    
    //MARK: - life cycle -
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - CreateAccountOutput -
extension CreateAccountViewController: CreateAccountViewOutput {
    func userSelectedCreateAccount(login: String, password: String) { }
}

//MARK: - CreateAccountInput -
extension CreateAccountViewController: CreateAccountViewInput {
//    var output: CreateAccountViewOutput
}

