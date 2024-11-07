import UIKit

final class AuthorizationViewController: UIViewController {
    //MARK: - Private properties -
    private let contentView = AuthorizationContentView()
    var output: AuthorizationViewOutput?
    
    //MARK: - Life cycle -
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        updateRegisterButtonState()
        contentView.setTextFieldDelegate(delegate: self)
        setAction()
    }
}

//MARK: AuthorizationViewInput
extension AuthorizationViewController: AuthorizationViewInput {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Localizable.alertAction, style: .default)
        alertController.addAction(action)
        self.present(alertController,animated: true)
    }
}

//MARK: - Public -
extension AuthorizationViewController {
    func setOutput(output: AuthorizationViewOutput) {
        self.output = output
    }
}

//MARK: - Private -
private extension AuthorizationViewController {
    func setupNavigation() {
        navigationItem.title = Localizable.enterTitle
    }
    
    func updateRegisterButtonState() {
        let isEmail = contentView.emailText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let isBoolEmail = isEmail?.isEmpty ?? true
        let isPassword = contentView.passwordText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let isBoolPassword = isPassword?.isEmpty ?? true
        let enableButton = isBoolEmail || isBoolPassword
        contentView.enabelButton(enable: !enableButton)
    }
    
    func setAction() {
        contentView.enterButtonAction = { [weak self] in
            guard let self else { return }
            self.output?.userSelectedEnterInAccount(login: contentView.emailText ?? "", password: contentView.passwordText ?? "")
        }
        
        contentView.registrationButtonAction = { [weak self] in
            guard let self else { return }
            self.output?.userSelectedCreateAccount()
        }
    }
}

//MARK: - UITextFieldDelagate -
extension AuthorizationViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateRegisterButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
