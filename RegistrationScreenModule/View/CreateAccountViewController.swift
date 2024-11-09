import UIKit

fileprivate enum Constants {
    static let validColor: CGColor = UIColor.init(red: 64/255, green: 145/255, blue: 86/255, alpha: 1).cgColor
    static let noValid: CGColor = UIColor.init(red: 231/255, green: 76/255, blue: 60/255, alpha: 1).cgColor
}

final class CreateAccountViewController: UIViewController {
    //MARK: - Private properties -
    private let contentView = CreateAccountContentView()
    private let networking = NetworkDataFetcher()
    
    var output: CreateAccountViewOutput?
    
    //MARK: - life cycle -
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigetionController()
        setAction()
        contentView.setTextFieldDelegate(delegate: self)
        updateRegisterButtonState()
        setupNotification()
    }
    
    deinit {
        deleteNotification()
    }
}

//MARK: - CreateAccountViewInput -
extension CreateAccountViewController: CreateAccountViewInput {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Localizable.alertAction, style: .default)
        alertController.addAction(action)
        self.present(alertController,animated: true)
    }
}

//MARK: - Public -
extension CreateAccountViewController {
    func setOutput(output: CreateAccountViewOutput) {
        self.output = output
    }
}

//MARK: - Private -
private extension CreateAccountViewController {
    func setupNavigetionController() {
        navigationItem.title = Localizable.registrationTitle
    }
    
    func validMail(mail: String) {
        guard let output else { return }
        if output.validateEmail(mail: mail) {
            contentView.mailBorderColor(color: Constants.validColor)
        } else {
            contentView.mailBorderColor(color: Constants.noValid)
        }
    }
    
    func validPassword(password: String) {
        guard let output else { return }
        if output.validPassword(password: password) {
            contentView.passwordBorderColor(color: Constants.validColor)
        } else {
            contentView.passwordBorderColor(color: Constants.noValid)
        }
    }
    
    func validRepeatPassword(repeatPassword: String, password: String) {
        guard let output else { return }
        if output.validRepeatPassword(password: password, repeatPassword: repeatPassword) {
            contentView.repeatBorderColor(color: Constants.validColor)
        } else {
            contentView.repeatBorderColor(color: Constants.noValid)
        }
    }
    
    func setAction() {
        contentView.buttonAction = { [weak self] in
            guard let self else { return }
            self.output?.userSelectedCreateAccount(login: contentView.emailText ?? "", password: contentView.passwordText ?? "")
        }
    }
    
    func updateRegisterButtonState() {
        let isEmailValid = output?.validateEmail(mail: contentView.emailText ?? "") ?? false
        let isPasswordValid = output?.validPassword(password: contentView.passwordText ?? "") ?? false
        let isRepeatPasswordValid = output?.validRepeatPassword(password: contentView.passwordText ?? "", repeatPassword: contentView.repeatPasswordText ?? "") ?? false
        let enableButton = isEmailValid && isPasswordValid && isRepeatPasswordValid
        contentView.enabelButton(enable: enableButton)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height - 200
        UIView.animate(withDuration: 0.3) {
            self.contentView.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.contentView.transform = .identity
        }
    }
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func deleteNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - UITextFieldDelegate -
extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch textField.tag {
        case 0:
            validMail(mail: text)
        case 1:
            validPassword(password: text)
            
        case 2:
            validRepeatPassword(repeatPassword: text, password: contentView.passwordText ?? "")
        default : break
        }
        updateRegisterButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
