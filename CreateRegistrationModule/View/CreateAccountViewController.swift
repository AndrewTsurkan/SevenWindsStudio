import UIKit

final class CreateAccountViewController: UIViewController {
    //MARK: - Private properties -
    private let contentView = CreateAccountContentView()
    private let networking = NetworkDataFetcher()
    
    //MARK: - life cycle -
    override func loadView() {
        view = contentView
        networking.fetchJson { [weak self] (result: Result<CreateAccountEntity, Error>) in
            switch result {
                case .success(let data):
                print(data)
            case .failure(let error):
                print("error")
            }
        }
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigetionController()
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

//MARK: - Private -
private extension CreateAccountViewController {
    func setupNavigetionController() {
        navigationItem.title = Localizable.registrationTitle
    }
}
