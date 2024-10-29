import UIKit

final class CreateAccountViewController: UIViewController {

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

